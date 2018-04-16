package view.page;

import js.jquery.JQuery;
import js.jquery.Event;
import utils.Handy;
import utils.Message;
import utils.Modalwindow;
import view.page.*;

class TabControler {

	private static var _jParent : JQuery;

	/* =======================================================================
		Init
	========================================================================== */
	public static function init(jParent:JQuery):Void {

		_jParent = jParent.find('.tab-controler');
		_jParent.on('click','[data-switch]',onClick);

	}

	/* =======================================================================
		On Click
	========================================================================== */
	private static function onClick(event:Event):Void {

		var action:String = new JQuery(event.currentTarget).data('switch');
		switch (action) {
			case 'increment':increment();
			case 'decrement':decrement();
		}

	}

	/* =======================================================================
		Increment
	========================================================================== */
	private static function increment():Void {

		MemoManager.addTab({
			id   : Handy.getUniqueID(),
			name : 'Note',
			value: ''
		});

		Message.say('add tab','success');

	}

	/* =======================================================================
		decrement
	========================================================================== */
	public static function decrement():Void {

		Modalwindow.ask({

			title : 'Delete note',
			text  : 'Can I delete it?'
			
		},function():Void {

			MemoManager.removeTab();
			Message.say('remove tab','success');

		});

	}

}
