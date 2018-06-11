function popUp(URL) {
  day = new Date();
  id = day.getTime();
  eval("page" + id + " = window.open(URL, '" + id + "', 'toolbar=1,scrollbars=1,location=1,statusbar=1,menubar=1,resizable=1,width=800,height=600');");
}


function popUpImg(img) {
  day = new Date();
  id = day.getTime();
  eval("page" + id + " = window.open('showimage.php?f=' + img, '" + id + "', 'toolbar=0,scrollbars=0,location=0,statusbar=0,menubar=0,resizable=0,width=420,height=320');");
}


function changeAllCheckbox() {
  var f=document.getElementById('form');
  for(i=0; i<f.elements.length; i++) {
    if ((f.elements[i].type != "checkbox") || (f.elements[i].name == "changeall")) { continue; }
    f.elements[i].checked = !f.elements[i].checked;
    if (f.elements[i].checked) {
      //addClass (f.elements[i].parentNode.parentNode, 'active');
    }
    else {
      //removeClass (f.elements[i].parentNode.parentNode, 'active');
    }
  }
}  

function hasClass(ele,cls) {
	return ele.className.match(new RegExp('(\\s|^)'+cls+'(\\s|$)'));
}
function addClass(ele,cls) {
	if (!this.hasClass(ele,cls)) { ele.className += " "+cls; }
}
function removeClass(ele,cls) {
	if (hasClass(ele,cls)) {
		var reg = new RegExp('(\\s|^)'+cls+'(\\s|$)');
		ele.className=ele.className.replace(reg,' ');
	}
}