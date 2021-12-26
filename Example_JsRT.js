// toast = (help) => {
//     return help;
// }

function toast(app, text) {
    // Alias for convenience.
    // var N = Windows.UI.Notifications;
    var Popups = Windows.UI.Popups
    Popups.MessageDialog(text, "Title").showAsync(app || "AutoHotkey");
    var toastNotifier = N.ToastNotificationManager.createToastNotifier(app || "AutoHotkey");
    var notification = new N.ToastNotification(toastXml);
    toastNotifier.show(notification);
}
    // Get the template XML as an XmlDocument.
//     var toastXml = N.ToastNotificationManager.getTemplateContent(N.ToastTemplateType[template]);
//     // Insert our content.
//     var i = 0;
//     for (let el of toastXml.getElementsByTagName("text")) {
//         if (typeof text == 'string') {
//             el.innerText = text;
//             break;
//         }
//         el.innerText = text(++i);
//     }
//     toastXml.getElementsByTagName("image")[0].setAttribute("src", image);
//     // Show the notification.
//     var toastNotifier = N.ToastNotificationManager.createToastNotifier(app || "AutoHotkey");
//     var notification = new N.ToastNotification(toastXml);
//     toastNotifier.show(notification);
//     // Unlike TrayTip, this API lets us hide the notification:
//     if (yesno("Hide the notification?")) {
//         toastNotifier.hide(notification);
//     }
// }
// function clearAllToasts(app) {
//     Windows.UI.Notifications.ToastNotificationManager.history.clear(app);
// }