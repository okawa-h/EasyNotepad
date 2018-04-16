package view;

import js.jquery.JQuery;
import js.jquery.Event;
import view.*;
import view.page.*;

class PageManager {

	private static var _jParent:JQuery;
	private static var _pageMap:Map<String,Page>;

	/* =======================================================================
		Init
	========================================================================== */
	public static function init():Void {

		_jParent = new JQuery('<div id="pages"></div>');
		Main.append(_jParent);
		
		_pageMap = new Map();
		_pageMap['memo']    = new Memo();
		_pageMap['setting'] = new Setting();

		new JQuery('[data-jump]').on({ 'click':onShow });

	}

		/* =======================================================================
			Add HTML
		========================================================================== */
		public static function addHTML(html:String) {

			_jParent.append(html);

		}

		/* =======================================================================
			Set
		========================================================================== */
		public static function set(data:Dynamic) {

			for (key in _pageMap.keys()) {
				_pageMap[key].set(data);
			}

			hideAll();
			_pageMap['memo'].show();

		}

		/* =======================================================================
			Save
		========================================================================== */
		public static function save():Void {

			getCurrentPage().save();

		}

		/* =======================================================================
			On Enter Key
		========================================================================== */
		public static function onEnterKey():Void {

			getCurrentPage().onEnterKey();

		}

		/* =======================================================================
			On Keyup
		========================================================================== */
		public static function onKeyup():Void {

			getCurrentPage().onKeyup();

		}

	/* =======================================================================
		On Show
	========================================================================== */
	private static function onShow(event:Event):Void {

		hideAll();
		var pagename : String = new JQuery(event.currentTarget).data('jump');
		_pageMap[pagename].show();

	}

	/* =======================================================================
		Hide All
	========================================================================== */
	private static function hideAll():Void {

		for (key in _pageMap.keys()) {
			_pageMap[key].hide();
		}

	}

	/* =======================================================================
		Get Current Page
	========================================================================== */
	private static function getCurrentPage():Page {

		for (key in _pageMap.keys()) {
			var page : Page = _pageMap[key];
			if (page.isCurrent()) return page;
		}
		return null;

	}

}
