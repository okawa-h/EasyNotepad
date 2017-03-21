package utils;

import js.jquery.JQuery;

class ContactTab {

	private static var _storage : Dynamic;

	/* =======================================================================
		Send
	========================================================================== */
	public static function get(status:String,callback:Dynamic):Void {

		untyped chrome.tabs.query({ active:true }, function(tab) {

			chrome.tabs.sendMessage(tab[0].id, { status:status }, function(response:Dynamic) {

				callback(response);

			});
		});

	}


}
