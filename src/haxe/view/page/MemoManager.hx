package view.page;

import js.jquery.JQuery;
import js.jquery.Event;
import view.*;
import view.page.*;
import utils.*;

class MemoManager {

	private static var _pagename : String;
	private static var _jParent  : JQuery;
	private static var _jNavi    : JQuery;
	private static var _jContent : JQuery;
	private static var _tabMap   : Map<String,Tab>;

	/* =======================================================================
		Init
	========================================================================== */
	public static function init(jParent:JQuery,pagename:String):Void {

		_pagename = pagename;
		_jParent  = jParent;
		_jNavi    = _jParent.find('.tab-navi');
		_jContent = _jParent.find('.content');
		_tabMap   = new Map();

		_jParent.find('[data-add]').on('click',function(event) {
			setAddButton(event);
		});
		TabControler.init(_jParent);

	}

		/* =======================================================================
			Save
		========================================================================== */
		public static function save():Void {

			Storage.save(_pagename,getData());
			focus();

		}

		/* =======================================================================
			Set
		========================================================================== */
		public static function set(data:Array<Dynamic>):Void {

			for (i in 0 ... data.length) {
				var tab : Tab = new Tab(data[i]);
				_tabMap[tab.getID()] = tab;
			}

			setTabButton();
			activeFirstTab();

		}

		/* =======================================================================
			Focus
		========================================================================== */
		public static function focus():Void {

			getActiveTab().focus();

		}

	/* =======================================================================
		Set Tab Button
	========================================================================== */
	private static function setTabButton():Void {

		_jNavi.find('.page-tab').off().on('click',function(event:Event) {

			var jTarget : JQuery = new JQuery(event.currentTarget);
			var id      : String = jTarget.data('area_tab');
			var tab     : Tab    = _tabMap[id];

			if (tab.isEdit()) return;
			if (tab.isActive()) {

				tab.editName();
				return;
			}

			hideAll();
			tab.show();
			focus();

		});

	}

		/* =======================================================================
			Set Add Button
		========================================================================== */
		public static function setAddButton(event:Event):Void {

			var key : String = new JQuery(event.currentTarget).data('add');
			switch (key) {
				case 'url':
					addUrl();
				case 'time':
					addTime();
			}

		}

		/* =======================================================================
			Get Data
		========================================================================== */
		public static function getData():Array<Dynamic> {

			var datas : Array<Dynamic> = [];
			for (tab in _tabMap) {
				datas.push({
					id    : tab.getID(),
					name  : tab.getName(),
					value : tab.getValue()
				});
			}

			return datas;

		}

		/* =======================================================================
			Get Active Tab
		========================================================================== */
		public static function getActiveTab():Tab {

			var id : String = _jNavi.find('.active').data('area_tab');
			return _tabMap[id];

		}

		/* =======================================================================
			Add Navi HTML
		========================================================================== */
		public static function addNaviHTML(html:String):Void {

			_jNavi.append(html);

		}

		/* =======================================================================
			Get Navi
		========================================================================== */
		public static function getNavi():JQuery {

			return _jNavi;

		}

		/* =======================================================================
			Add Content HTML
		========================================================================== */
		public static function addContentHTML(html:String):Void {

			_jContent.append(html);

		}

		/* =======================================================================
			Get Content
		========================================================================== */
		public static function getContent():JQuery {

			return _jContent;

		}

		/* =======================================================================
			Add Tab
		========================================================================== */
		public static function addTab(data:Dynamic):Void {

			var tab : Tab = new Tab(data);
			_tabMap[tab.getID()] = tab;
			setTabButton();

		}

		/* =======================================================================
			Remove Tab
		========================================================================== */
		public static function removeTab():Void {

			var id : String = getActiveTab().getID();
			_tabMap[id].remove();
			_tabMap.remove(id);
			activeFirstTab();

		}

	/* =======================================================================
		Active First Tab
	========================================================================== */
	private static function activeFirstTab():Void {

		_jNavi.find('.page-tab').first().click();

	}

	/* =======================================================================
		Hide All
	========================================================================== */
	private static function hideAll():Void {

		for (tab in _tabMap) {
			tab.hide();
		}

	}

	/* =======================================================================
		Add Url
	========================================================================== */
	private static function addUrl():Void {

		Handy.getTabData('url',function(response:Dynamic) {

			var text    : String = '';
			var title   : String = Reflect.getProperty(response,'title');
			var location: String = Reflect.getProperty(response,'location');

			if (title == null && location == null) {
				Message.say('Failed to get "title,location"','error');
				return;
			}

			if (title == null) {
				Message.say('Failed to get "title"','error');
			} else {
				text += title + '\n';
			}

			if (location == null) {
				Message.say('Failed to get "location"','error');
			} else {
				text += location;
			}

			getActiveTab().addText(text);
			save();

		});

	}

	/* =======================================================================
		Add Time
	========================================================================== */
	private static function addTime():Void {

		var date : String = DateTools.format(Date.now(),'【%Y.%m.%d %H:%M】');
		getActiveTab().addText(date);
		save();

	}

}
