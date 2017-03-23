package utils;

import Manager.APP_NAME;
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
	public static function get(callback:Dynamic):Void {

		_storage.get(APP_NAME,function(object:Dynamic) {

			var data : Dynamic = Reflect.getProperty(object,APP_NAME);
			callback(data);

		});

	}

	/* =======================================================================
		Save
	========================================================================== */
	public static function save(key:String,value:Dynamic):Void {

		get(function(data:Dynamic) {

			if (data == null) {
				data = {};
			}
			Reflect.setProperty(data,key,value);
			var object : Dynamic = {};
			Reflect.setProperty(object,APP_NAME,data);
			_storage.set(object,function() {

					Message.send('Successfully saved "' + key + '"','success');

				}
			);

		});

	}

}
