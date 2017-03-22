package utils;

class Handy {

	/* =======================================================================
		Get Unique ID
	========================================================================== */
	public static function getUniqueID(?original:Int):String {

		var strong : Int = 1000;
		if (original != null) strong = original;

		var id   : String = '';
		var date : Date = Date.now();
		var year  : Int = date.getFullYear();
		var month : Int = date.getMonth() + 1;
		var day   : Int = date.getDate();
		var hour  : Int = date.getHours();
		var minute: Int = date.getMinutes();
		var time  : String = '${year}${month}${day}${hour}${minute}';

		id = time + Math.floor(strong * Math.random());

		return id;

	}


}
