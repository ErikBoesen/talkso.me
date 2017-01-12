// TODO: Fairly sure creating a global.js file is not the best way to do this.

$(document).on('turbolinks:load', function() {
    // Aliases for nav-related elements
    var navButton = document.getElementById('nav-button'),
    	nav = document.getElementsByTagName('nav')[0];

    // Manage menu opening & closing
    navButton.onclick = function() {
    	if (navButton.className === 'open') {
    		navButton.className = '';
    		nav.className = '';
    	} else {
    		navButton.className = 'open';
    		nav.className = 'open';
    	}
    };
});
