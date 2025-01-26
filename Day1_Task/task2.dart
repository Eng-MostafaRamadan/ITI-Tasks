void main() {
  checkNumber(number: 10);
}

int checkNumber({required int number}) {
  if (number % 2 == 0) {
    print("the number is even");
  } else {
    print("the number is odd");
  }
  return 0;
}
