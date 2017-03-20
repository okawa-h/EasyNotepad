package ;

import js.Browser;
import js.jquery.JQuery;
import js.jquery.Event;

class Main {
	
	public static function main():Void {

		new JQuery('document').ready(Manager.init);

	}

}
