package view.page;

import js.jquery.JQuery;
import view.*;
import utils.*;

class Memo extends Page {

	private static var jTextarea : JQuery;

	/* =======================================================================
		Init
	========================================================================== */
	public override function new():Void {

		super('memo');
		jTextarea = new JQuery('#textarea');
		jTextarea.focus();

	}

	/* =======================================================================
		Save
	========================================================================== */
	public override function save():Void {

		var value : String = jTextarea.val();
		Storage.save(_pagename,value);
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
		Focus
	========================================================================== */
	public override function focus():Void {

		jTextarea.focus();

	}

}
