import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:papa_gusto_app/models/cart_item.dart';
import 'package:papa_gusto_app/models/food.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

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

  // user cart
  final List<CartItem> _cart = [];
  String _deliveryAddress = 'Введите адрес';

  List<Food> get menu => _menu;
  List<CartItem> get cart => _cart;
  String get deliveryAddress => _deliveryAddress;

  void addToCart(Food food, List<Addon> selectedAddons) {
    CartItem? cartItem = _cart.firstWhereOrNull((item) =>
        item.food == food &&
        const ListEquality().equals(item.selectedAddons, selectedAddons));

    if (cartItem != null) {
      cartItem.quantity++;
    } else {
      _cart.add(CartItem(food: food, selectedAddons: selectedAddons));
    }
    notifyListeners();
  }

  void removeFromCart(CartItem cartItem) {
    int cartIndex = _cart.indexOf(cartItem);
    if (cartIndex != -1) {
      _cart[cartIndex].quantity > 1
          ? _cart[cartIndex].quantity--
          : _cart.removeAt(cartIndex);
    }
    notifyListeners();
  }

  int getTotalPrice() {
    return _cart.fold(0, (total, cartItem) {
      int itemTotal = cartItem.food.price +
          cartItem.selectedAddons.fold(0, (sum, addon) => sum + addon.price);
      return total + itemTotal * cartItem.quantity;
    });
  }

  int getTotalItemCount() =>
      _cart.fold(0, (total, item) => total + item.quantity);

  void clearCart() {
    _cart.clear();
    notifyListeners();
  }

  void updateDeliveryAddress(String newAddress) {
    _deliveryAddress = newAddress;
    notifyListeners();
  }

  String displayCartReceipt() {
    final receipt = StringBuffer();
    receipt
      ..writeln('Ваш чек.')
      ..writeln()
      ..writeln(DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now()))
      ..writeln()
      ..writeln('------------');

    for (final cartItem in _cart) {
      final totalPrice = cartItem.quantity * cartItem.food.price;
      receipt.writeln(
          '${cartItem.quantity} x ${cartItem.food.name} - ${_formatPrice(totalPrice)}');

      if (cartItem.selectedAddons.isNotEmpty) {
        receipt
            .writeln('  Дополнения: ${_formatAddons(cartItem.selectedAddons)}');
      }
      receipt.writeln();
    }

    receipt
      ..writeln('------------')
      ..writeln()
      ..writeln('Всего позиций: ${getTotalItemCount()}')
      ..writeln('Итого: ${_formatPrice(getTotalPrice())}')
      ..writeln()
      ..writeln('Доставка: $deliveryAddress');

    return receipt.toString();
  }

  String _formatPrice(int price) => '${price.toStringAsFixed(2)}₸';

  String _formatAddons(List<Addon> addons) {
    return addons
        .map((addon) => '${addon.name} (${_formatPrice(addon.price)})')
        .join(', ');
  }

  Future<void> sendOrderNotificationToWhatsApp() async {
    final String phoneNumber = '+77054109814';
    final String message = Uri.encodeComponent(displayCartReceipt());
    final Uri url = Uri.parse('https://wa.me/$phoneNumber?text=$message');

    if (await canLaunchUrl(url)) {
      await launchUrl(
        url,
        mode: LaunchMode
            .externalApplication, // Убедимся, что открываем во внешнем приложении.
      );
    } else {
      throw Exception('Не удалось отправить сообщение в WhatsApp');
    }
  }
}
