$(document).on("page:change", 

function() {

	var n = 0;
	var dates = new Array();
	var xhr = new XMLHttpRequest();
	while($('#calendar').data("date-" + n) != undefined){
		dates[n] = {
			date: $('#calendar').data("date-" + n),
			value: 10,
			url: $('#calendar').data("date-url-" + n)
		};
		n++;
	};

    $('#calendar').gammacalendar(dates, {
	        weeks: 34,
	        i18n: 'zh',
	        startOnSunday: true,
	        highlightToday: false,
	        baseColor: {
	            r: 0,
	            g: 200,
	            b: 200
	        }
	    }
	);
}
);