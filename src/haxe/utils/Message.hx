package utils;

import js.jquery.JQuery;

class Message {

	private static var _jParent:JQuery;

	/* =======================================================================
		Init
	========================================================================== */
	public static function init():Void {

		_jParent = new JQuery('<div id="message"></div>');
		Main.append(_jParent);

	}

		/* =======================================================================
			Send
		========================================================================== */
		public static function say(text:String,status:String):Void {

			var jText:JQuery = new JQuery('<p class="${status}">${text}</p>');
			_jParent.empty().append(jText);

			function onComplete() {

				jText.delay(1500)
					.animate({ opacity:0 },200,jText.remove);

			}

			jText.css({ top:5,opacity:0 })
				.animate({ top:0,opacity:1 },100,'easeInOutSine',onComplete);

		}

}
