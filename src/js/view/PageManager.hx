package view;

import js.jquery.JQuery;
import js.jquery.Event;
import view.*;
import view.page.*;

class PageManager {

	private static var _Pages : Map<String,Page>;

	/* =======================================================================
		Init
	========================================================================== */
	public static function init():Void {

		_Pages = new Map();
		_Pages['memo']    = new Memo();
		_Pages['setting'] = new Setting();

		new JQuery('[data-jump]').on('click',function(event:Event) {

			hideAll();
			var id : String = new JQuery(event.currentTarget).data('jump');
			_Pages[id].show();

		});

	}

	/* =======================================================================
		Set
	========================================================================== */
	public static function setView(data:Dynamic) {

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

}
