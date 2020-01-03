/**
 * Kotlin to Javascript
 */
window.double = function(number) {
    $('.text').text(number);
};

/**
 * Javascript to Kotlin
 */
var Interface = function() {};

Interface.prototype.double = function(number) {
    alert("double:" + number);
};
