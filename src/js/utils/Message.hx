package utils;

import js.jquery.JQuery;
import js.jquery.Event;

class Message {

	private static var _jParent : JQuery;

	/* =======================================================================
		Init
	========================================================================== */
	public static function init():Void {

		_jParent = new JQuery('#message');

	}

	/* =======================================================================
		Send
	========================================================================== */
	public static function send(message:String,status:String):Void {

		var jText : JQuery = _jParent
			.empty()
			.append('<p class="' + status + '">' + message + '</p>')
			.find('p');

		jText
			.css({ top:5,opacity:0 })
			.animate({ top:0,opacity:1 },100,'easeInOutSine',
				function() {
					jText
						.delay(1500)
						.animate({ opacity:0 },200,function() {
							jText.remove();
						});
				});

	}

}
