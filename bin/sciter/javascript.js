+function (appname) {
    //view.msgbox() variants
    self.ns.alert = function (msg) { view.msgbox(#alert, msg, appname); };
    self.ns.error = function (msg) { view.msgbox(#error, msg, appname); };
    self.ns.info = function (msg) { view.msgbox(#information, msg, appname); };
    self.ns.question = function (msg) { view.msgbox(#question, msg, appname, [#yes, #no]); };
}("Foo");

self.on("click", "#alert", function () { alert("Alert here!"); });
self.on("click", "#error", function () { error("Error here!"); });
self.on("click", "#info", function () { info("Information here!"); });
self.on("click", "#question", function () { question("¿Bailas el tango?"); });