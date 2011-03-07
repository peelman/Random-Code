function setActivePage() {
        links = $('menu').select('a.menua');
		pathname = window.location.pathname;
		pathname = pathname.substring(pathname.lastIndexOf('/')+1);
		
		if (pathname == "") {
			links.toArray().first().addClassName('active');
			return;
		}
		
		links.each(function(element, index) {
			if (element.readAttribute('href').endsWith(pathname)) {
				element.addClassName('active');
			}
		});
		
}

window.onload=function(){
 setActivePage();
}