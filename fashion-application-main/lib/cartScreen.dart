import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_cart/provider/cartProvider.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => CartProvider()),
        ],
        child: Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: const Text('Cart'),
            ),
            body: Column(
              children: [
                cart.getCartList().isEmpty
                    ? const Expanded(
                        child: Center(
                        child: Text('Cart is empty'),
                      ))
                    : Expanded(
                        child: ListView.builder(
                          itemCount: cart.getCartList().length,
                          itemBuilder: (context, index) {
                            return Card(
                              child: ListTile(
                                leading: Image.network(
                                  cart.getCartList()[index].image!,
                                  width: 100,
                                  height: 100,
                                ),
                                title: Text(cart.getCartList()[index].title!),
                                subtitle:
                                    Text(cart.getCartList()[index].price!),
                                trailing: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        cart.decrementQuantity(index);
                                      },
                                      icon: const Icon(Icons.remove),
                                    ),
                                    Text(cart
                                        .getCartList()[index]
                                        .quantity
                                        .toString()),
                                    IconButton(
                                      onPressed: () {
                                        cart.incrementQuantity(index);
                                      },
                                      icon: const Icon(Icons.add),
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        cart.removeCart(index);
                                      },
                                      icon: const Icon(Icons.delete),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                Container(
                  height: 50,
                  width: double.infinity,
                  color: Colors.black,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 10.0),
                        child: Text(
                          'Total Price',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 10.0),
                        child: Text(
                          '\$${cart.totalPrice.toStringAsFixed(2).toString()}',
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      if (cart.getCartList().isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Cart is empty')));
                      } else {
                        cart.clearCart();
                        showDialog<void>(
                          context: context,
                          barrierDismissible: false, // user must tap button!
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text('Thanks you for shopping'),
                              content: SingleChildScrollView(
                                child: ListBody(
                                  children: const <Widget>[
                                    Text('Your order has been placed'),
                                  ],
                                ),
                              ),
                              actions: <Widget>[
                                TextButton(
                                  child: const Text('Close'),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      }
                    },
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.white)),
                    child: const Text('Check Out',
                        style: TextStyle(color: Colors.black)),
                  ),
                )
              ],
            )));
  }
}
