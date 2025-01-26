void main() {
  for (int i = 1; i <= 20; i++) {
    if (i % 3 == 0 && i % 5 == 0) {
      print("FizzBuzz"); // Divisible by both 3 and 5
    } else if (i % 3 == 0) {
      print("Fizz"); // Divisible by 3
    } else if (i % 5 == 0) {
      print("Buzz"); // Divisible by 5
    }
  }
}
