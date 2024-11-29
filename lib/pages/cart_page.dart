import 'package:flutter/material.dart';
import 'package:papa_gusto_app/components/my_button.dart';
import 'package:papa_gusto_app/components/my_cart_tile.dart';
import 'package:papa_gusto_app/models/restaurant.dart';
import 'package:papa_gusto_app/pages/payment_page.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Restaurant>(
      builder: (context, restaurant, child) {
        // Корзина
        final userCart = restaurant.cart;

        // UI Scaffold
        return Scaffold(
          appBar: AppBar(
            title: const Text('Корзина'),
            backgroundColor: Colors.transparent,
            foregroundColor: Theme.of(context).colorScheme.inversePrimary,
            actions: [
              // Кнопка очистки корзины
              IconButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                              title: const Text(
                                  'Вы уверены что хотите очистить корзину?'),
                              actions: [
                                // Кнопка отмены
                                TextButton(
                                    onPressed: () => Navigator.pop(context),
                                    child: const Text('Отмена')),

                                // Кнопка подтверждения
                                TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                      restaurant.clearCart();
                                    },
                                    child: const Text('Да')),
                              ],
                            ));
                  },
                  icon: const Icon(Icons.delete))
            ],
          ),
          body: Column(
            children: [
              // Список товаров в корзине
              Expanded(
                child: Column(
                  children: [
                    userCart.isEmpty
                        ? const Expanded(
                            child: Center(
                              child: Text('Корзина пуста..'),
                            ),
                          )
                        : Expanded(
                            child: ListView.builder(
                              itemCount: userCart.length,
                              itemBuilder: (context, index) {
                                // Получить конкретный элемент корзины
                                final cartItem = userCart[index];

                                // Вернуть UI элемента корзины
                                return MyCartTile(cartItem: cartItem);
                              },
                            ),
                          ),
                  ],
                ),
              ),

              // Кнопка оплаты
              MyButton(
                onTap: () async {
                  // Отправка заказа в WhatsApp
                  try {
                    await restaurant.sendOrderNotificationToWhatsApp();
                    // Переход к странице оплаты
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const PaymentPage()),
                    );
                  } catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Ошибка при отправке: $e'),
                      ),
                    );
                  }
                },
                text: 'Перейти к оплате',
              ),

              const SizedBox(height: 25),
            ],
          ),
        );
      },
    );
  }
}
