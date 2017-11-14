package ;

import js.Browser;
import js.jquery.JQuery;
import js.jquery.Event;
import utils.*;
import view.*;

class Main {

	public static inline var APP_NAME : String = 'EASY_NOTEPAD';

	/* =======================================================================
		Main
	========================================================================== */
	public static function main():Void {

		new JQuery('document').ready(init);

	}

	/* =======================================================================
		Init
	========================================================================== */
	public static function init(event:Event):Void {

		Storage.init();
		Message.init();
		Modalwindow.init();
		EventManager.init();
		PageManager.init();
		setCloseButton();

		onInit();

	}

	/* =======================================================================
		On Init
	========================================================================== */
	private static function onInit():Void {

		Storage.get(function(data:Dynamic) {

			PageManager.set(data);
			Message.say('on loaded','nice');

		});

	}

	/* =======================================================================
		Set Close Button
	========================================================================== */
	private static function setCloseButton():Void {

		new JQuery('#button-close').on('click',function() {

			PopupWindow.close();

		});

	}

}
