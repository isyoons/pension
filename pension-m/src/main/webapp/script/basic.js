$(document).ready(function(event) {
	setNavSize();
	$(".sidecontents").trigger("heightChange");
	$(".sidecontents").bind("heightChange", function(event) {
		setNavSize();
	});
});
function setNavSize() {
	var totalWinSize = getWindowSize()[1] + getScrollXY()[1] - 50;
	$(".sidenav").css("height", totalWinSize+"px");
	if(getWidthSize() < 767) {
		$(".sidenav").css("height", "auto");
	}
}
function getWidthSize() {
	var myWidth = 0;
	if (typeof (window.innerWidth) == 'number') {
		myWidth = window.innerWidth;
	} else if (document.documentElement
			&& (document.documentElement.clientWidth || document.documentElement.clientHeight)) {
		myWidth = document.documentElement.clientWidth;
	} else if (document.body
			&& (document.body.clientWidth || document.body.clientHeight)) {
		myWidth = document.body.clientWidth;
	}
	return myWidth;
	
}
function getWindowSize() {
	var myWidth = 0, myHeight = 0;
	if (typeof (window.innerWidth) == 'number') {
		//Non-IE
		myWidth = window.innerWidth;
		myHeight = window.innerHeight;
	} else if (document.documentElement
			&& (document.documentElement.clientWidth || document.documentElement.clientHeight)) {
		//IE 6+ in 'standards compliant mode'
		myWidth = document.documentElement.clientWidth;
		myHeight = document.documentElement.clientHeight;
	} else if (document.body
			&& (document.body.clientWidth || document.body.clientHeight)) {
		//IE 4 compatible
		myWidth = document.body.clientWidth;
		myHeight = document.body.clientHeight;
	}
	//window.alert('Width = ' + myWidth);
	//window.alert('Height = ' + myHeight);
	return [myWidth, myHeight];
}

function getScrollXY() {
	var scrOfX = 0, scrOfY = 0;
	if (typeof (window.pageYOffset) == 'number') {
		//Netscape compliant
		scrOfY = window.pageYOffset;
		scrOfX = window.pageXOffset;
	} else if (document.body
			&& (document.body.scrollLeft || document.body.scrollTop)) {
		//DOM compliant
		scrOfY = document.body.scrollTop;
		scrOfX = document.body.scrollLeft;
	} else if (document.documentElement
			&& (document.documentElement.scrollLeft || document.documentElement.scrollTop)) {
		//IE6 standards compliant mode
		scrOfY = document.documentElement.scrollTop;
		scrOfX = document.documentElement.scrollLeft;
	}
	//window.alert('scrollx = ' + scrOfX);
	//window.alert('scrolly = ' + scrOfY);
	return [ scrOfX, scrOfY ];
}