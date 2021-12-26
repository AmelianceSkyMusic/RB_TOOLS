; ==========================================================
;                  .NET Framework Interop
;      https://autohotkey.com/boards/viewtopic.php?t=4633
; ==========================================================
;
;   Author:     Lexikos
;   Version:    1.2
;   Requires:	AutoHotkey_L v1.0.96+
;

CLR_LoadLibrary(AssemblyName, AppDomain=0) ;111111111111111111111111111111111111111111111
{
  if !AppDomain
    AppDomain := CLR_GetDefaultDomain()
  e := ComObjError(0)
  Loop 1 {
    if assembly := AppDomain.Load_2(AssemblyName)
      break
    static null := ComObject(13,0)
    args := ComObjArray(0xC, 1),  args[0] := AssemblyName
    typeofAssembly := AppDomain.GetType().Assembly.GetType()
    if assembly := typeofAssembly.InvokeMember_3("LoadWithPartialName", 0x158, null, null, args)
      break
    if assembly := typeofAssembly.InvokeMember_3("LoadFrom", 0x158, null, null, args)
      break
  }
  ComObjError(e)
  return assembly
}

CLR_CreateObject(Assembly, TypeName, Args*) ;55555555555555555555555555
{
  if !(argCount := Args.MaxIndex())
    return Assembly.CreateInstance_2(TypeName, true)

  vargs := ComObjArray(0xC, argCount)
  Loop % argCount
    vargs[A_Index-1] := Args[A_Index]

  static Array_Empty := ComObjArray(0xC,0), null := ComObject(13,0)

  return Assembly.CreateInstance_3(TypeName, true, 0, null, vargs, null, Array_Empty)
}


; NOTE: IT IS NOT NECESSARY TO CALL THIS FUNCTION unless you need to load a specific version.
CLR_Start(Version="") ;333333333333333333333333333333333333333333 ; returns ICorRuntimeHost* 
{
  static RtHst := 0
  ; The simple method gives no control over versioning, and seems to load .NET v2 even when v4 is present:
  ; return RtHst ? RtHst : (RtHst:=COM_CreateObject("CLRMetaData.CorRuntimeHost","{CB2F6722-AB3A-11D2-9C40-00C04FA30A3E}"), DllCall(NumGet(NumGet(RtHst+0)+40),"uint",RtHst))
  if RtHst
    return RtHst
  EnvGet SystemRoot, SystemRoot
  if Version =
    Loop % SystemRoot "\Microsoft.NET\Framework" (A_PtrSize=8?"64":"") "\*", 2
      if (FileExist(A_LoopFileFullPath "\mscorlib.dll") && A_LoopFileName > Version)
        Version := A_LoopFileName
  if DllCall("mscoree\CorBindToRuntimeEx", "wstr", Version, "ptr", 0, "uint", 0
  , "ptr", CLR_GUID(CLSID_CorRuntimeHost, "{CB2F6723-AB3A-11D2-9C40-00C04FA30A3E}")
  , "ptr", CLR_GUID(IID_ICorRuntimeHost,  "{CB2F6722-AB3A-11D2-9C40-00C04FA30A3E}")
  , "ptr*", RtHst) >= 0
    DllCall(NumGet(NumGet(RtHst+0)+10*A_PtrSize), "ptr", RtHst) ; Start
  return RtHst
}

;
; INTERNAL FUNCTIONS
;

CLR_GetDefaultDomain() ;2222222222222222222222222222222222222222222222
{
  static defaultDomain := 0
  if !defaultDomain
  { ; ICorRuntimeHost::GetDefaultDomain
    if DllCall(NumGet(NumGet(0+RtHst:=CLR_Start())+13*A_PtrSize), "ptr", RtHst, "ptr*", p:=0) >= 0
      defaultDomain := ComObject(p), ObjRelease(p)
  }
  return defaultDomain
}

CLR_GUID(ByRef GUID, sGUID) ;44444444444444444444444444444444444444444444
{
  VarSetCapacity(GUID, 16, 0)
  return DllCall("ole32\CLSIDFromString", "wstr", sGUID, "ptr", &GUID) >= 0 ? &GUID : ""
}