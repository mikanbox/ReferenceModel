import Toybox.Application;
import Toybox.Lang;
import Toybox.WatchUi;

class ReferenceModelApp extends Application.AppBase {

    function initialize() {
        AppBase.initialize();
    }

    // onStart() is called on application start up for as follows:
    // - Load OAuth tokens
    // - Get StartTime
    function onStart(state as Dictionary?) as Void {
    }

    // onStop() is called when your application is exiting for as follows:
    // - Store OAuth tokens
    function onStop(state as Dictionary?) as Void {
    }

    // Return the initial view of your application in `ReferenceModelView.mc`
    // We can return 2 item types
    // - Views
    // - InputDelegates
    // 入力も変更できるっぽいのが謎。サンプルだと画面レイアウトだけ変更している
    function getInitialView() as Array<Views or InputDelegates>? {
        return [ new ReferenceModelView() ] as Array<Views or InputDelegates>;
    }

}

function getApp() as ReferenceModelApp {
    return Application.getApp() as ReferenceModelApp;
}