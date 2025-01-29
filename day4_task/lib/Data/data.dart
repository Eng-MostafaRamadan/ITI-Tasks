import 'category.dart';
import 'product.dart';

class Data {
  List<Category> CategoryList = [
    Category(
      id: 1,
      namec: "Vegetables pizza",
      image: "assets/Vegetablespizza.jpeg",
    ),
    Category(
      id: 2,
      namec: "Cheese pizza",
      image: "assets/Cheesepizza.jpeg",
    ),
    Category(
      id: 3,
      namec: "Fries",
      image: "assets/Fries.jpeg",
    ),
    Category(
      id: 4,
      namec: "Noodles",
      image: "assets/Noodles.jpg",
    ),
    Category(
      id: 5,
      namec: "Burger",
      image: "assets/Burger.jpg",
    ),
  ];

  List<Product> ProductList = [
    Product(
      id: 1,
      name: "xxxxxxxxxxxxxxxxxxxxx",
      categoryID: 1,
      imgURL: "assets/Vegetablespizza.jpeg",
    ),
    Product(
      id: 2,
      name: "",
      categoryID: 2,
      imgURL: "assets/Cheesepizza.jpeg",
    ),
    Product(
      id: 3,
      name: "",
      categoryID: 3,
      imgURL: "assets/Fries.jpeg",
    ),
    Product(
      id: 4,
      name: "",
      categoryID: 4,
      imgURL: "assets/Noodles.jpg",
    ),
    Product(
      id: 5,
      name: "",
      categoryID: 5,
      imgURL: "ssets/Burger.jpg",
    ),
  ];
}
