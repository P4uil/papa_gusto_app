import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:papa_gusto_app/models/cart_item.dart';
import 'package:papa_gusto_app/models/food.dart';

class Restaurant extends ChangeNotifier {
  //list of food menu
  final List<Food> _menu = [
    //pizzas

    Food(
        name: 'Пепперони',
        description:
            'Тонкое тесто, салями из говядины, соус из свежих томатов, моцарелла',
        imagePath: 'lib/images/pizzas/peperoni.png',
        price: 2800,
        availableAddons: [],
        category: FoodCategory.pizzas),

    Food(
        name: 'Трюфельная пицца',
        description:
            'Тонкое тесто, трюфельная паста, шампиньоны, сливочный соус, моцарелла',
        imagePath: 'lib/images/pizzas/truffle.png',
        price: 3300,
        availableAddons: [],
        category: FoodCategory.pizzas),

    Food(
        name: 'Маргарита',
        description:
            'Тонкое тесто, соус из свежих томатов, моцарелла, ароматный базилик',
        imagePath: 'lib/images/pizzas/margarita.png',
        price: 2100,
        availableAddons: [],
        category: FoodCategory.pizzas),

    Food(
        name: 'Сырная пицца',
        description: 'Тонкое тесто, моцарелла, пармезан, чедр, сыр дорБлю',
        imagePath: 'lib/images/pizzas/cheeasy.png',
        price: 3100,
        availableAddons: [],
        category: FoodCategory.pizzas),

    Food(
        name: 'Тоскана',
        description:
            'Тонкое тесто, куриная грудка, черри, сыр салякис, слвочеый соус, руккола',
        imagePath: 'lib/images/pizzas/toscana.png',
        price: 3500,
        availableAddons: [],
        category: FoodCategory.pizzas),

    Food(
        name: 'Пицца гарганзоль и груша',
        description:
            'Тонкое тесто, груша, сыр дорБлю, моцарелла, сливочный соус',
        imagePath: 'lib/images/pizzas/pear.png',
        price: 3100,
        availableAddons: [],
        category: FoodCategory.pizzas),

    Food(
        name: 'Болоньезе',
        description:
            'Тонкое тесто, говяжий фарш, базилик, сливочный соус, моцарелла',
        imagePath: 'lib/images/pizzas/baloneze.png',
        price: 3300,
        availableAddons: [],
        category: FoodCategory.pizzas),

    Food(
        name: 'Дубайская',
        description:
            'Тонкое тесто, куриная грудка, ананас, сыр дорБлю, сливочный соус',
        imagePath: 'lib/images/pizzas/dubai.png',
        price: 3500,
        availableAddons: [],
        category: FoodCategory.pizzas),

    Food(
        name: 'Ветчина с грибами',
        description:
            'Тонкое тесто, ветчина из индейки, грибы шампиньоны, моцарелла, сливочный соус',
        imagePath: 'lib/images/pizzas/hamandmushrums.png',
        price: 3300,
        availableAddons: [],
        category: FoodCategory.pizzas),

    //sides
    Food(
        name: 'Панауцио Альфредо',
        description:
            'Куриная грудка, сливочно грибной соус, руккола, томаты свежие, бальзамический крем',
        imagePath: 'lib/images/sides/palfredo.png',
        price: 1800,
        availableAddons: [],
        category: FoodCategory.sides),

    Food(
        name: 'Панауцио с ветчиной и трюфелем',
        description:
            'Ветчина из индейки, трюфельная паста, руккола, томаты свежие, бальзамический крем',
        imagePath: 'lib/images/sides/phamandtruffle.png',
        price: 3300,
        availableAddons: [],
        category: FoodCategory.sides),

    Food(
        name: 'Панауцио с томленой говядиной',
        description:
            'Томленая говядина, томаты свежие, домашний майонез, лук фиолетовый, руккола, бальзамический крем',
        imagePath: 'lib/images/sides/pbeef.png',
        price: 2800,
        availableAddons: [],
        category: FoodCategory.sides),

    Food(
        name: 'Фри (лодочки)',
        description: '',
        imagePath: 'lib/images/sides/potato.png',
        price: 1000,
        availableAddons: [],
        category: FoodCategory.sides),

    Food(
        name: 'Нагетсы',
        description: '',
        imagePath: 'lib/images/sides/nugets.png',
        price: 1200,
        availableAddons: [],
        category: FoodCategory.sides),

    //sushi
    Food(
        name: 'Филадельфия ролл',
        description: 'Суши рис, лосось охлажденный, огурцы свежие, кремета сыр',
        imagePath: 'lib/images/sushi/filadelfia.png',
        price: 3200,
        availableAddons: [],
        category: FoodCategory.sushi),

    Food(
        name: 'Поцелуй гейши',
        description:
            'Суши рис, угорь, лосось, свежие огурцы, кремета, икра тобико, унаги соус, кунжут',
        imagePath: 'lib/images/sushi/geishaskiss.png',
        price: 3900,
        availableAddons: [],
        category: FoodCategory.sushi),

    Food(
        name: 'Запеченный ролл с лососсем',
        description: 'Суши рис, лосось, сыр кремета, огурцы свежие',
        imagePath: 'lib/images/sushi/bakedsalmon.png',
        price: 3000,
        availableAddons: [],
        category: FoodCategory.sushi),

    Food(
        name: 'Темпура микс',
        description: 'Суши рис, угорь, сыр кремета, огурцы свежие',
        imagePath: 'lib/images/sushi/tempuramix.png',
        price: 3600,
        availableAddons: [],
        category: FoodCategory.sushi),

    Food(
        name: 'Снежный краб',
        description:
            'Суши рис, снежный краб, кремета, огурцы свежие, лосось, соус унаги-майо',
        imagePath: 'lib/images/sushi/snowycrab.png',
        price: 2700,
        availableAddons: [],
        category: FoodCategory.sushi),

    Food(
        name: 'Ролл с авокадо и лососсем',
        description:
            'Суши рис, лосось, авокадо, кремета, огурцы свежие, соус спайси-майо',
        imagePath: 'lib/images/sushi/avokadoandsalmon.png',
        price: 3600,
        availableAddons: [],
        category: FoodCategory.sushi),

    Food(
        name: 'Канада ролл',
        description:
            'Суши рис, лосось, авокадо, кремета, огурцы свежие, соус спайси-майо',
        imagePath: 'lib/images/sushi/canadian.png',
        price: 4100,
        availableAddons: [],
        category: FoodCategory.sushi),

    Food(
        name: 'Калифорния',
        description:
            'Суши рис, лосось, авокадо, кремета, огурцы свежие, соус спайси-майо',
        imagePath: 'lib/images/sushi/california.png',
        price: 1950,
        availableAddons: [],
        category: FoodCategory.sushi),
  ];

  //user cart
  final List<CartItem> _cart = [];

  //delivery address (which user can change/update)
  //add user current location
  String _deliveryAddress = 'Введите адрес';

  //getters
  List<Food> get menu => _menu;
  List<CartItem> get cart => _cart;
  String get deliveryAddress => _deliveryAddress;

  //operations

  //add to cart
  void addToCart(Food food, List<Addon> selectedAddons) {
    //see if there is cart item already with the same food and selected addons
    CartItem? cartItem = _cart.firstWhereOrNull((item) {
      //check if the food items are the same
      bool isSameFood = item.food == food;

      //check if the list of selected addons are the same
      bool isSameAddons =
          const ListEquality().equals(item.selectedAddons, selectedAddons);

      return isSameFood && isSameAddons;
    });

    //if item already exests, increase its quantity
    if (cartItem != null) {
      cartItem.quantity++;
    }
    //otherwise add a new item to the cart
    else {
      _cart.add(
        CartItem(
          food: food,
          selectedAddons: selectedAddons,
        ),
      );
    }
    notifyListeners();
  }

  //remove from cartre
  void removeFromCart(CartItem cartItem) {
    int cartIndex = _cart.indexOf(cartItem);

    if (cartIndex != -1) {
      if (_cart[cartIndex].quantity > 1) {
        _cart[cartIndex].quantity--;
      } else {
        _cart.removeAt(cartIndex);
      }
    }

    notifyListeners();
  }

  //get total price cart
  int getTotalPrice() {
    int total = 0;

    for (CartItem cartItem in _cart) {
      int itemTotal = cartItem.food.price;

      for (Addon addon in cartItem.selectedAddons) {
        itemTotal += addon.price;
      }

      total += itemTotal * cartItem.quantity;
    }

    return total;
  }

  //get total number of items in cart
  int getTotalItemCount() {
    int totalItemCount = 0;

    for (CartItem cartItem in _cart) {
      totalItemCount += cartItem.quantity;
    }

    return totalItemCount;
  }

  //clear cart
  void clearCart() {
    _cart.clear();
    notifyListeners();
  }

  //update delivery address
  void updateDeliveryAddress(String newAddress) {
    _deliveryAddress = newAddress;
    notifyListeners();
  }

  //helpers

  //generate a reciept
  String displayCartReceipt() {
    final receipt = StringBuffer();
    receipt.writeln('Ваш чек.');
    receipt.writeln();

    //format date to include up to  seconds only
    String formattedDate =
        DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());

    receipt.writeln(formattedDate);
    receipt.writeln();
    receipt.writeln('------------');

    for (final cartItem in _cart) {
      // Рассчитайте общую цену для данного товара с учетом количества
      final totalPrice = cartItem.quantity * cartItem.food.price;

      // Печатаем количество, название и общую цену для позиции
      receipt.writeln(
          '${cartItem.quantity} x ${cartItem.food.name} - ${_formatPrice(totalPrice)}');

      if (cartItem.selectedAddons.isNotEmpty) {
        receipt
            .writeln('  Дополнения: ${_formatAddons(cartItem.selectedAddons)}');
      }
      receipt.writeln();
    }

    receipt.writeln('------------');
    receipt.writeln();
    receipt.writeln('Всего позиций: ${getTotalItemCount()}');
    receipt.writeln('Итого: ${_formatPrice(getTotalPrice())}');
    receipt.writeln();
    receipt.writeln('Доставка: $deliveryAddress');

    return receipt.toString();
  }

  //format int ot money
  String _formatPrice(int price) {
    return '${price.toStringAsFixed(2)}₸';
  }

  //format list of addons to a string summary
  String _formatAddons(List<Addon> addons) {
    return addons
        .map((addon) => '${addon.name} (${_formatPrice(addon.price)})')
        .join(', ');
  }
}
