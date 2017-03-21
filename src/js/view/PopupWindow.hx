package view;

import js.Browser;
import js.html.Window;
import js.jquery.JQuery;
import js.jquery.Event;

class PopupWindow {

	private static var _window  : Window = Browser.window;
	private static var _jWindow : JQuery = new JQuery(Browser.window);

	/* =======================================================================
		Init
	========================================================================== */
	public static function init():Void {


	}

	/* =======================================================================
		Get
	========================================================================== */
	public static function get():JQuery {

		return _jWindow;

	}

	/* =======================================================================
		Close
	========================================================================== */
	public static function close():Void {

		_window.close();

	}

}
