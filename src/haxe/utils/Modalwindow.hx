package utils;

import js.jquery.JQuery;
import js.jquery.Event;
import view.PopupWindow;

class Modalwindow {

	private static var _jParent :JQuery;
	private static var _jBg     :JQuery;
	private static var _jContent:JQuery;
	private static var _jField  :JQuery;

	/* =======================================================================
		Init
	========================================================================== */
	public static function init():Void {

		_jParent = new JQuery('<div id="modalwindow"></div>');
		Main.append(_jParent);
		setHTML();

		_jBg      = _jParent.find('.background');
		_jContent = _jParent.find('.modalwindow-content');
		_jField   = _jParent.find('.modalwindow-field');
		
		_jBg.on({ 'click':onClickBg });
		_jParent.find('.button-close').on({ 'click':close });

	}

		/* =======================================================================
			Ask
		========================================================================== */
		public static function ask(message:{title:String,text:String},?callback:Void->Void):Void {

			var html : String =
				'<p class="title">${message.title}</p>
				<p class="text">${message.text}</p>';

			_jField.html(html);
			if (callback != null) {

				_jField
					.append(getJudgeButtonHTML())
					.find('.judge')
					.off()
					.on('click','button',function(event:Event) {

						var action : Bool = new JQuery(event.currentTarget).data('action');
						if (action) callback();
						close();

					});

			}

			open();

		}

	/* =======================================================================
		Open
	========================================================================== */
	private static function open():Void {

		_jParent.show();

		var top : Float = _jContent.height() * .5;
		_jBg.css({ opacity:0 }).animate({ opacity:1 },200);
		_jContent
			.css({ top:'50%',opacity:0 })
			.animate({ marginTop:-top,opacity:1 },200);

	}

	/* =======================================================================
		Close
	========================================================================== */
	private static function close():Void {

		_jBg.animate({ opacity:0 },200,_jParent.hide);

	}

	/* =======================================================================
		On Click Bg
	========================================================================== */
	private static function onClickBg(event:Event):Void {

		if (!new JQuery(event.target).hasClass('background')) return;
		close();

	}

	/* =======================================================================
		Set HTML
	========================================================================== */
	private static function setHTML():Void {

		_jParent.append(
			'<div class="background">
				<div class="modalwindow-content">
					<div class="modalwindow-field"></div>
					<button class="button-close">×</button>
				</div>
			</div>');

	}

	/* =======================================================================
		Get Judge Button HTML
	========================================================================== */
	private static function getJudgeButtonHTML():String {

		return 
			'<div class="judge">
				<button data-action="true">Yes</button>
				<button data-action="false">No</button>
			</div>';

	}

}
