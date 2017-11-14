package view;

import js.Browser;
import js.html.Window;
import js.jquery.JQuery;

class PopupWindow {

	private static var _window  : Window = Browser.window;
	private static var _jWindow : JQuery = new JQuery(Browser.window);

		/* =======================================================================
			Get
		========================================================================== */
		public static function get():JQuery {

			return _jWindow;

		}

		/* =======================================================================
			Get Height
		========================================================================== */
		public static function getHeight():Float {

			return _jWindow.height();

		}

		/* =======================================================================
			Close
		========================================================================== */
		public static function close():Void {

			_window.close();

		}

}
