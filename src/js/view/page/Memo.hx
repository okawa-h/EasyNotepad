package view.page;

import js.jquery.JQuery;
import js.jquery.Event;
import view.*;
import view.page.*;
import utils.*;

class Memo extends Page {

	/* =======================================================================
		Init
	========================================================================== */
	public override function new():Void {

		super('memo');
		MemoManager.init(_jParent,_pagename);

	}

	/* =======================================================================
		Save
	========================================================================== */
	public override function save():Void {

		MemoManager.save();

	}

	/* =======================================================================
		Set
	========================================================================== */
	public override function set(data:Dynamic):Void {

		var dataArray : Array<Dynamic> = super.getData(data);
		MemoManager.set(dataArray);

		// var testData = [{
		// 	id   : 1,
		// 	name : 'Memo',
		// 	value: '1これはMemo'
		// },{
		// 	id   : 2,
		// 	name : 'Git',
		// 	value: '2これはMemo'
		// }];
		// Storage.save(_pagename,testData);

	}

	/* =======================================================================
		On Keyup
	========================================================================== */
	public override function onKeyup():Void {

		if (!MemoManager.getActiveTab().isFocus()) return;
		save();

	}

	/* =======================================================================
		Focus
	========================================================================== */
	public override function focus():Void {

		MemoManager.focus();

	}

		/* =======================================================================
			Set HTML
		========================================================================== */
		private override function setHTML():Void {

			var html : String = '
				<section data-content="${_pagename}">
					<header class="header">
						<nav class="tab-navi"></nav>
						<div class="tab-controler">
							<button class="button-switch" data-switch="increment">+</button>
							<button class="button-switch" data-switch="decrement">-</button>
						</div>
					</header>
					<div class="content"></div>
					<button class="button-utils" data-add="url"><span>URL</span></button>
					<button class="button-utils" data-add="time"><span>TIME</span></button>
					<button class="button-jump" data-jump="setting">&nbsp;</button>
				</section>';

			PageManager.addHTML(html);

		}

}
