+function (appname) {
    //view.msgbox() variants
    self.ns.alert = function (msg) { view.msgbox(#alert, msg, appname); };
    self.ns.error = function (msg) { view.msgbox(#error, msg, appname); };
    self.ns.info = function (msg) { view.msgbox(#information, msg, appname); };
    self.ns.question = function (msg) { view.msgbox(#question, msg, appname, [#yes, #no]); };
}("Amazing App");

self.on("click", "#alert", function () { alert("Внимание, Юра переходит на дефолтную тему!"); });
self.on("click", "#error", function () { error("Переход не удался!"); });
self.on("click", "#info", function () { info("js ≠ jsfx!"); });
self.on("click", "#question", function () { question("Почему переход не удался?"); });
// $(button).on("click", function () {view.close(); });
self.on("click", "#close", function () {view.close(); });
// self.on("click", "#maximize", function () {view.move(); });

// var x = 0;

// function change() {
//     x = x + 1;
//     $(p).value = x;
//     return true;
// }

// function self.ready() {

//     view.state = View.WINDOW_SHOWN;

//     view << event statechange {
//     $(button#maximize).attributes.toggleClass("restore", view.windowState == View.WINDOW_MAXIMIZED); 
//     } 
//     // self.timer(1s, change);
// }

// view.root << event closerequest (evt) {

// const REASONS = ["BY CHROME", "BY CODE", "BY LOAD"];

// var result = view.msgbox { 
//     type:#question, 
//     content:"closing " + REASONS[evt.reason], 
//     buttons:[#yes,#no]
// };

// if(result === #no)
//     evt.cancel = true ; //to cancel closing

// };

// $(button).on("click", function() {
//     view.close();
// });