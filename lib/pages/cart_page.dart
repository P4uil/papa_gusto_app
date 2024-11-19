import 'package:flutter/material.dart';
import 'package:papa_gusto_app/components/my_button.dart';
import 'package:papa_gusto_app/components/my_cart_tile.dart';
import 'package:papa_gusto_app/models/restaurant.dart';
import 'package:papa_gusto_app/pages/delivery_progress_page.dart';
import 'package:papa_gusto_app/pages/payment_page.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Restaurant>(
      builder: (context, restaurant, child) {
        //cart
        final userCart = restaurant.cart;

        //scaffold UI
        return Scaffold(
          appBar: AppBar(
            title: const Text('Корзина'),
            backgroundColor: Colors.transparent,
            foregroundColor: Theme.of(context).colorScheme.inversePrimary,
            actions: [
              //clear cart button
              IconButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                              title: const Text(
                                  'Вы уверены что хотите очистить корзину?'),
                              actions: [
                                //action button
                                TextButton(
                                    onPressed: () => Navigator.pop(context),
                                    child: const Text('Отмена')),

                                //yes button
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
              //list of cart
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
                                //get individual cart item
                                final cartItem = userCart[index];

                                //return cart tileUI
                                return MyCartTile(cartItem: cartItem);
                              },
                            ),
                          ),
                  ],
                ),
              ),

              //buttom to pay
              MyButton(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const DeliveryProgressPage())),
                text: 'Перейти к оплате',
              ),

              const SizedBox(height: 25)
            ],
          ),
        );
      },
    );
  }
}
