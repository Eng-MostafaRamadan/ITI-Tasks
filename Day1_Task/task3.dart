void main() {
  print("The DiscountedPrice is " +
      calculateDiscount(originalPrice: 100, discountPercent: 10).toString());
}

double calculateDiscount(
    {required double originalPrice, double discountPercent = 10}) {
  double discountAmount;
  double discountedPrice;

  discountAmount = originalPrice * (discountPercent / 100);
  discountedPrice = originalPrice - discountAmount;

  return discountedPrice;
}
