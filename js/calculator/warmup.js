// Build a function my_max() which takes an array and returns the maximum number.

var array = [1,4,7,3,8,3,5,0,1,2];

function my_max(arr) {
  var max = 0;
  for (var i = 0; i < arr.length; i++) {
    if (arr[i] > max) {
      max = arr[i];
    }
  }
  console.log(max);
}

my_max(array);

// Build a function vowel_count() which takes a string and returns the number of vowels (AEIOUY).

var string = "wa hello yabu dybi";
var vowels = "aeiouy";

function vowel_count(str) {
  var counter = 0;
  for (var i = 0; i < str.length; i++) {
    if (vowels.split("").includes(str[i])) {
      counter += 1;
    }
  }
  console.log(counter);
}

vowel_count(string);

// Build a function reverse() which takes a string and returns all the characters in the opposite position, e.g. reverse("this is a string") // "gnirts a si siht"

var testString = "test string for test";

function reverse(str) {
  var strReversed = "";
  for (var i = str.length - 1; i > 0; i--) {
    strReversed += str[i];
  }
  console.log(strReversed);
}

reverse(testString);