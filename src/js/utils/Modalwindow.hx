package utils;

import js.jquery.JQuery;
import js.jquery.Event;

class Modalwindow {

	private static var _jParent : JQuery;

	/* =======================================================================
		Init
	========================================================================== */
	public static function init():Void {

		_jParent = new JQuery('#modalwindow');

		_jParent.find('.background').on({ 'click':close });
		setHTML();

	}

		/* =======================================================================
			Close
		========================================================================== */
		private static function close():Void {
		}

		/* =======================================================================
			Set HTML
		========================================================================== */
		private static function setHTML():Void {

			_jParent.append('
				<div class="background">
					<div class="modalwindow-content">
						<div class="modalwindow-field">
							<p class="title">てすと</p>
							<p class="text">message.</p>
						</div>
					</div>
				</div>');

		}

}
