package ;

import js.Browser;
import js.jquery.JQuery;
import js.jquery.Event;
import utils.*;
import view.*;

class Manager {

	public static inline var APP_NAME : String = 'memomemo';

	/* =======================================================================
		Init
	========================================================================== */
	public static function init(event:Event):Void {

		PopupWindow.init();
		Storage.init();
		Message.init();

		EventManager.init();
		PageManager.init();
		setCloseButton();

		onInit();

	}

		/* =======================================================================
			On Init
		========================================================================== */
		private static function onInit():Void {

			Storage.get(function(data) {

				PageManager.setView(data);
				Message.send('on loaded','nice');

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
