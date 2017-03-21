package view.page;

import js.Browser;
import js.jquery.JQuery;
import js.jquery.Event;
import view.*;
import utils.*;

class Memo extends Page {

	private static var jTextarea : JQuery;

	/* =======================================================================
		Init
	========================================================================== */
	public override function new():Void {

		super('memo');
		jTextarea = _jParent.find('.textarea');
		jTextarea.focus();

		_jParent.find('.button-url').on({ 'click':addUrl });
		_jParent.find('.button-time').on({ 'click':addTime });

	}

	/* =======================================================================
		Save
	========================================================================== */
	public override function save():Void {

		Storage.save(_pagename,getValue());
		focus();

	}

	/* =======================================================================
		Set
	========================================================================== */
	public override function set(data:Dynamic):Void {

		var value : String = super.getData(data);
		jTextarea.val(value);

	}

	/* =======================================================================
		On Keyup
	========================================================================== */
	public override function onKeyup():Void {

		if (!isFocus()) return;
		save();

	}

	/* =======================================================================
		Focus
	========================================================================== */
	public override function focus():Void {

		jTextarea.focus();

	}

		/* =======================================================================
			Is Focus
		========================================================================== */
		private function isFocus():Bool {

			return jTextarea.is(':focus');

		}

		/* =======================================================================
			Get Value
		========================================================================== */
		private function getValue():String {

			return jTextarea.val();

		}

		/* =======================================================================
			Add Url
		========================================================================== */
		private function addUrl(event:Event):Void {

			ContactTab.get('url',function(response:Dynamic) {

				var text    : String = '';
				var title   : String = Reflect.getProperty(response,'title');
				var location: String = Reflect.getProperty(response,'location');

				if (title == null && location == null) {
					Message.send('Failed to get "title,location"','error');
					return;
				}

				if (title == null) {
					Message.send('Failed to get "title"','error');
				} else {
					text += title + '\n';
				}

				if (location == null) {
					Message.send('Failed to get "location"','error');
				} else {
					text += location;
				}

				addText(text);

			});

		}

		/* =======================================================================
			Add Time
		========================================================================== */
		private function addTime(event:Event):Void {

			var date : Date = Date.now();
			var y : Int = date.getFullYear();
			var m : Int = date.getMonth() + 1;
			var d : Int = date.getDate();
			var h : Int = date.getHours();
			var m : Int = date.getMinutes();
			addText('【${y}/${m}/${d}/${h}/${m}】');

		}

		/* =======================================================================
			Add Text
		========================================================================== */
		private function addText(text:String):Void {

			var value    : String = getValue();
			var position : Int    = untyped jTextarea.get(0).selectionStart;
			var before   : String = value.substr(0,position);
			var after    : String = value.substr(position,value.length);

			if (value.substr(position-1,position) != '\n') before += '\n';
			if (value.substr(position,position + 1) != '\n') after = '\n' + after;

			jTextarea.val(before + text + after);

		}

}
