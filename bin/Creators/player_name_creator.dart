String playerNameFixed(String input) {
if(input.contains(" ")) {
  input.toLowerCase().split(" ").map((word) {
    if (word.isNotEmpty) {
      input = word[0].toUpperCase() + word.substring(1);
    }
  });
} else {
 input = input[0].toUpperCase() + input.substring(1);
}
return input;
}