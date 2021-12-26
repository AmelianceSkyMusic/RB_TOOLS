try
{
    ToolTip "Working..."
    Example1()
}
catch e
{
    ; For more detail about the object that e contains, see Catch.
    MsgBox("Exception thrown!`n`nwhat: " e.what "`nfile: " e.file,, 16)
}
finally
{
    ToolTip ; hide the ToolTip
}

MsgBox "Done!"

; This function has a Finally block that acts as cleanup code
Example1()
{
    try
        menuSettibngsYML := Yaml("file.yml")[1]
        MsgBox Yaml(menuSettingsYML, 5)
    finally
        MsgBox "This is always executed regardless of exceptions"
}

