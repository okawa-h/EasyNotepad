package utils;

import js.Browser;
import js.jquery.JQuery;
import js.jquery.Event;
import view.PageManager;

using Lambda;

class EventManager {

	private static var _jWindow : JQuery = new JQuery(Browser.window);
	private static var _keys    : Array<Int>;

	/* =======================================================================
		Init
	========================================================================== */
	public static function init():Void {

		_keys = new Array();

		_jWindow.on({

			keydown : onKeydown,
			keyup   : onKeyup

		});

	}

		/* =======================================================================
			On Keydown
		========================================================================== */
		private static function onKeydown(event:Event):Void {

			_keys.push(event.keyCode);

			if (_keys.has(91) && event.keyCode == 13) {

				PageManager.onShortcutSave();

			}

		}

		/* =======================================================================
			On Keyup
		========================================================================== */
		private static function onKeyup(event:Event):Void {

			_keys = [];

			switch (event.keyCode) {
				case 13:
					PageManager.onEnterKey();
			}

		}

}
