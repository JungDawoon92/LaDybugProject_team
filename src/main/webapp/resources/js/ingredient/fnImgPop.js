function fnImgPop(url) {
	var img = new Image();
	img.src = url;
	var img_width=img.width;
	var win_width=img.width+600; //50
	var img_height = img.height;
	var win_height = img.height+400;
	var OpenWindow = window.open('','_blank', 'width='+600+', height='+600+', menubars=no, scrollbars=auto');
	OpenWindow.document.write("<style>body{margin:0; width:600px; height:600px;  }</style><img src='"+url+"' width='"+win_width+"'>");
}