package utils;

class Handy {

		/* =======================================================================
			Get Unique ID
		========================================================================== */
		public static function getUniqueID(?original:Int):String {

			var strong:Int = 1000;
			if (original != null) strong = original;

			var time:String = DateTools.format(Date.now(),'%Y%m%d%H%M');
			var id  :String = time + Math.floor(strong * Math.random());

			return id;

		}

		/* =======================================================================
			Get Tab
		========================================================================== */
		public static function getTabData(status:String,callback:Dynamic->Void):Void {

			untyped chrome.tabs.query({ active:true },function(tab) {

				chrome.tabs.sendMessage(tab[0].id, { status:status }, function(response:Dynamic) {

					callback(response);

				});
			});

		}


}
