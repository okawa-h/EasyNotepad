package view;

import js.jquery.JQuery;
import js.jquery.Event;
import view.*;
import view.page.*;

class PageManager {

	private static var _jParent : JQuery;
	private static var _Pages   : Map<String,Page>;

	/* =======================================================================
		Init
	========================================================================== */
	public static function init():Void {

		_jParent = new JQuery('#pages');
		_Pages   = new Map();
		_Pages['memo']    = new Memo();
		_Pages['setting'] = new Setting();

		new JQuery('[data-jump]').on({ 'click':onJumpButton });

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

		counter(function(page:Page) {
			page.set(data);
		});

		hideAll();
		_Pages['memo'].show();

	}

	/* =======================================================================
		On Shortcut Save
	========================================================================== */
	public static function onShortcutSave():Void {

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
			Hide All
		========================================================================== */
		private static function hideAll():Void {

			counter(function(page:Page) {
				page.hide();
			});

		}

		/* =======================================================================
			Get Current Page
		========================================================================== */
		private static function getCurrentPage():Page {

			var currentPage : Page = null;

			counter(function(page:Page) {

				if (page.isCurrent()) currentPage = page;

			});

			return currentPage;

		}

		/* =======================================================================
			Counter
		========================================================================== */
		private static function counter(func:Page->Void):Void {

			for (key in _Pages.keys()) {

				func(_Pages[key]);

			}

		}

		/* =======================================================================
			On Jump Button
		========================================================================== */
		private static function onJumpButton(event:Event):Void {

			hideAll();
			var pagename : String = new JQuery(event.currentTarget).data('jump');
			_Pages[pagename].show();

		}

}
