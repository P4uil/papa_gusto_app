//food item
class Food {
  final String name; // pizza
  final String description; //ingredients
  final String imagePath; //lib/images/pizza.png
  final int price; //3000
  final FoodCategory category; //pizza
  List<Addon> availableAddons; //[extra cheese]

  Food(
      {required this.name,
      required this.description,
      required this.imagePath,
      required this.price,
      required this.availableAddons,
      required this.category});
}

//food categories
enum FoodCategory {
  pizzas,
  sushi,
  sides,
}

//russion localised
extension FoodCategoryExtension on FoodCategory {
  String get displayName {
    switch (this) {
      case FoodCategory.pizzas:
        return 'Пиццы';
      case FoodCategory.sushi:
        return 'Суши';
      case FoodCategory.sides:
        return 'Закуски';
    }
  }
}

//food addons
class Addon {
  String name;
  int price;

  Addon({required this.name, required this.price});
}
