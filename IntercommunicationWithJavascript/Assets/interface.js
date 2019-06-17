/**
 * Swift to Javascript
 */
window.double = function(number) {
    $('.text').text(number);
};

/**
 * Javascript to Swift
 */
var Interface = function() {};

Interface.prototype.double = function(number) {
    window.webkit.messageHandlers.double.postMessage(number);
};
