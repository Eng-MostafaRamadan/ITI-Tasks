void main() {
  print(calculateDiscount(originalPrice: 100, discountPercent: 10));
}

double calculateDiscount(
    {required double originalPrice, double discountPercent = 10}) {
  double discountedPrice;

  discountedPrice = originalPrice * (discountPercent / 100);

  return discountedPrice;
}
