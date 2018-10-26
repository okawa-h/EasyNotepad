package ;

import js.Browser;
import js.jquery.JQuery;
import js.jquery.Event;
import utils.*;
import view.*;

class Main {

	public static inline var APP_NAME:String = 'EASY_NOTEPAD';
	private static var _jAll:JQuery;

	/* =======================================================================
		Main
	========================================================================== */
	public static function main():Void {

		new JQuery(Browser.document).ready(init);

	}

	/* =======================================================================
		Init
	========================================================================== */
	public static function init(event:Event):Void {

		_jAll = new JQuery('#all');

		Storage.init();
		Message.init();
		Modalwindow.init();
		EventManager.init();
		PageManager.init();

		append(new JQuery('<button class="window-ui" data-ui="close">✕</button>'));
		setData();

		_jAll.on('click','[data-ui]',onClick);

	}

	/* =======================================================================
		On Init
	========================================================================== */
	private static function setData():Void {

		Storage.get(function(data:Dynamic) {

			PageManager.set(data);
			Message.say('on loaded','nice');

		});

	}

	/* =======================================================================
		On Click
	========================================================================== */
	private static function onClick(event:Event):Void {

		var action:String = new JQuery(event.currentTarget).data('ui');
		switch (action) {
			case 'close':PopupWindow.close();
		}

	}

		/* =======================================================================
			Append
		========================================================================== */
		public static function append(jTarget:JQuery):Void {

			_jAll.children().append(jTarget);

		}

}
