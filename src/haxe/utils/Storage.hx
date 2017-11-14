package utils;

import Main.APP_NAME;
import js.jquery.JQuery;
import utils.*;

class Storage {

	private static var _storage : Dynamic;

	/* =======================================================================
		Init
	========================================================================== */
	public static function init():Void {

		_storage = untyped chrome.storage.local;

	}

		/* =======================================================================
			Save
		========================================================================== */
		public static function get(callback:Dynamic->Void):Void {

			_storage.get(APP_NAME,function(strage:Dynamic) {

				var data : Dynamic = Reflect.getProperty(strage,APP_NAME);
				callback(data);

			});

		}

		/* =======================================================================
			Save
		========================================================================== */
		public static function save(key:String,value:Dynamic):Void {

			get(function(data:Dynamic) {

				if (data == null) data = {};
				Reflect.setProperty(data,key,value);
				var strage : Dynamic = {};
				Reflect.setProperty(strage,APP_NAME,data);

				_storage.set(strage,function() {
						Message.say('Successfully saved "${key}"','success');
					}
				);

			});

		}

}
