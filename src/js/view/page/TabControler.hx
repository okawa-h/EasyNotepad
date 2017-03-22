package view.page;

import js.jquery.JQuery;
import js.jquery.Event;
import utils.Message;
import utils.Handy;
import view.page.*;

class TabControler {

	private static var _jParent : JQuery;

	/* =======================================================================
		Init
	========================================================================== */
	public static function init(jParent:JQuery):Void {

		_jParent = jParent.find('.tab-controler');
		new JQuery('[data-switch]').on({ 'click':onClick });

	}

		/* =======================================================================
			On Click
		========================================================================== */
		private static function onClick(event:Event):Void {

			var action : String = new JQuery(event.currentTarget).data('switch');

			switch (action) {
				case 'increment':
					increment();
				case 'decrement':
					decrement();
			}

		}

		/* =======================================================================
			Increment
		========================================================================== */
		private static function increment():Void {

			MemoManager.addTab({
				id   : Handy.getUniqueID(),
				name : 'test',
				value: ''
			});

			Message.send('add tab','success');

		}

		/* =======================================================================
			decrement
		========================================================================== */
		private static function decrement():Void {

			MemoManager.removeTab();

			Message.send('remove tab','success');

		}

}
