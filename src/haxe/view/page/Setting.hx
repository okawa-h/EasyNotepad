package view.page;

import js.jquery.JQuery;
import view.*;
import utils.*;

class Setting extends Page {

	private static var _jSettingList : JQuery;

	/* =======================================================================
		Init
	========================================================================== */
	public override function new():Void {

		super('setting');
		_jSettingList = _jParent.find('.setting-list').find('.input-setting');

	}

		/* =======================================================================
			Save
		========================================================================== */
		public override function save():Void {

			var data : Dynamic = getListData();

			if (!validate(data)) {
				Message.say('Input error','error');
				return;
			}

			setStyles(data);
			Storage.save(_pagename,data);

		}

		/* =======================================================================
			Set
		========================================================================== */
		public override function set(data:Dynamic):Void {

			var value : Dynamic = super.getData(data);
			setStyles(value,function(key:String,value:Dynamic) {
				_jSettingList.filter('[name="$key"]').val(value);
			});

		}

		/* =======================================================================
			Focus
		========================================================================== */
		public override function focus():Void {

			_jParent.find('input:visible').eq(0).focus();

		}

		/* =======================================================================
			On Enter Key
		========================================================================== */
		public override function onEnterKey():Void {

			var jCur  : JQuery = _jParent.find(':focus');
			var index : Int = _jSettingList.index(jCur);

			if (_jSettingList.length - 1 == index) {
				_jParent.find('.button-save').focus();
			} else {
				_jSettingList.eq(index + 1).focus();
			}

		}

	/* =======================================================================
		Set HTML
	========================================================================== */
	private override function setHTML():Void {

		var html : String = '
			<section data-content="${_pagename}">
				<header class="header">
					<h2 class="page-title">Setting</h2>
				</header>
				<div class="content">
					<ul class="setting-list">
						<li><label><p>Height (input textarea)</p><input class="input-setting" type="text" name="height">px</label></li>
						<li><label><p>Font size</p><input class="input-setting" type="text" name="fontSize">px</label></li>
					</ul>
				</div>
				<button class="button-save"><span>SAVE</span></button>
				<button class="button-jump" data-jump="memo">&nbsp;</button>
			</section>';

		PageManager.addHTML(html);

	}

	/* =======================================================================
		Get List Data
	========================================================================== */
	private function getListData():Dynamic {

		var data   : Dynamic = {};
		var length : Int = _jSettingList.length;

		for (i in 0 ... length) {

			var jTarget : JQuery = _jSettingList.eq(i);
			var key     : String = jTarget.prop('name');
			var value   : String = jTarget.val();
			Reflect.setField(data,key,value);
			
		}

		return data;

	}

	/* =======================================================================
		Set Styles
	========================================================================== */
	private function setStyles(data:Dynamic,?insertFunc:Dynamic):Void {

		var fields : Array<String> = Reflect.fields(data);
		for (i in 0 ... fields.length) {

			var key  : String  = fields[i];
			var value: Dynamic = Reflect.getProperty(data,key);
			setStyle(key,value);
			if (insertFunc != null) insertFunc(key,value);
			
		}

	}

	/* =======================================================================
		Set Style
	========================================================================== */
	private function setStyle(key:String,value:String):Void {

		switch(key) {
			case 'width':
				new JQuery('#all').css({ width:value });
			case 'height':
				new JQuery('.content-area').css({ height:value });
			case 'fontSize':
				if (value == '') value = '16';
				new JQuery('html').css({ fontSize:value + 'px' });
		}

	}

	/* =======================================================================
		Validate
	========================================================================== */
	private function validate(data:Dynamic):Bool {

		var result : Bool = true;

		// for (key in data) {

		// 	if (isNaN(data[key])) {
		// 		result = false;
		// 		break;
		// 	}

		// }

		return result;

	}

}
