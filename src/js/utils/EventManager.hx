package utils;

import js.jquery.Event;
import view.PageManager;
import view.PopupWindow;

using Lambda;

class EventManager {

	private static var _keys : Array<Int>;

	/* =======================================================================
		Init
	========================================================================== */
	public static function init():Void {

		_keys = new Array();

		PopupWindow.get().on({

			keydown : onKeydown,
			keyup   : onKeyup

		});

	}

	/* =======================================================================
		On Keydown
	========================================================================== */
	private static function onKeydown(event:Event):Void {

		var key : Int = event.keyCode;
		_keys.push(key);

		if (_keys.has(91) && key == 13) {

			PageManager.save();

		}

		if (_keys.has(91) && key == 67) {

			PopupWindow.close();

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

		PageManager.onKeyup();

	}

}
