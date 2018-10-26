package utils;

import js.jquery.JQuery;
import Main.APP_NAME;

class Storage {

	private static var _storage:Dynamic;

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

				var data:Dynamic = Reflect.getProperty(strage,APP_NAME);
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
				var storage:Dynamic = {};
				Reflect.setProperty(storage,APP_NAME,data);

				_storage.set(storage,function() {
						Message.say('Successfully saved "${key}"','success');
				});

			});

		}

}
