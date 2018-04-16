(function(window,$) {

	$(document).on('ready',function(){

		setMessageEvent();
		return false;
	});

	/* =======================================================================
		Set Message Event
	========================================================================== */
	function setMessageEvent() {

		chrome.runtime.onMessage.addListener(
			function (request, sender, sendResponse) {

				var data = getDate(request.status);
				sendResponse(data);

			}
		);

	}

	/* =======================================================================
		Get Data
	========================================================================== */
	function getDate(status) {

		var data = {};

		switch(status) {
			case 'url':
				data = {
					location : window.location.href,
					title    : $('title').text()
				};

		}

		return data;
	}

})(window,jQuery);
