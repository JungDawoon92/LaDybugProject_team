function fnImgPop(url) {
	var img = new Image();
	img.src = url;
	var img_width=img.width;
	var win_width=img.width+150; //50
	var img_height = img.height;
	var win_height = img.height+15;
	var OpenWindow = window.open('','_blank', 'width='+img_width+', height='+img_height+', menubars=no, scrollbars=auto');
	OpenWindow.document.write("<style>body{margin:0px; width:700px; }</style><img src='"+url+"' width='"+win_width+"'>");
}