import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_cart/loginScreen.dart';
import 'package:shopping_cart/provider/cartProvider.dart';
import 'package:shopping_cart/provider/login_provider.dart';
import 'package:shopping_cart/provider/productProvider.dart';

import 'cartScreen.dart';

void main() {
  runApp(const MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => ProductProvider()),
          ChangeNotifierProvider(create: (context) => CartProvider()),
          ChangeNotifierProvider(create: (context) => LoginProvider()),
        ],
        child: MaterialApp(
          title: 'Store',
          home: LoginScreen(),
          theme: ThemeData(
            primarySwatch: Colors.blueGrey,
          ),
        ));
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  static const List<Tab> tabs = <Tab>[
    Tab(
      icon: Icon(Icons.grid_on),
    ),
    Tab(
      icon: Icon(Icons.list),
    ),
  ];
  @override
  initState() {
    tabController = TabController(length: tabs.length, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var productProvider = Provider.of<ProductProvider>(context);
    productProvider.getListProduct();
    var cartProvider = Provider.of<CartProvider>(context);
    cartProvider.getCartList();

    var listItem = ListView.builder(
      itemCount: productProvider.listProduct.length,
      itemBuilder: (context, index) {
        return Card(
          child: ListTile(
            leading: Image.network(
              productProvider.listProduct[index].image!,
              width: 100,
              height: 100,
            ),
            title: Text(productProvider.listProduct[index].title!),
            subtitle: Text(productProvider.listProduct[index].price!),
            trailing: IconButton(
              onPressed: () {
                cartProvider.addCart(productProvider.listProduct[index]);
              },
              icon: const Icon(Icons.add_shopping_cart),
            ),
          ),
        );
      },
    );

    var gridItem = GridView.count(
      primary: false,
      padding: const EdgeInsets.all(20),
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      crossAxisCount: 2,
      children: <Widget>[
        ...productProvider.listProduct.map((e) {
          return Card(
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Image.network(
                  e.image!,
                  width: 100,
                  height: 100,
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Center(
                    child: Text(
                      e.title!,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
                Center(
                  child: Text(e.price!),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: ElevatedButton(
                      onPressed: () {
                        cartProvider.addCart(e);
                      },
                      style: ElevatedButton.styleFrom(
                          primary: Colors.black,
                          textStyle: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                      child: const Text('Add to Cart')),
                ),
              ],
            ),
          ));
        })
      ],
    );

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Store"),
          actions: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Badge(
                badgeContent: Text(cartProvider.cart.length.toString()),
                child: IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const CartScreen()));
                  },
                  icon: const Icon(Icons.shopping_cart),
                ),
              ),
            )
          ],
          bottom: TabBar(
            tabs: tabs,
            controller: tabController,
          ),
        ),
        body: TabBarView(
          controller: tabController,
          children: [
            gridItem,
            listItem,
          ],
        ),
      ),
    );
  }
}
