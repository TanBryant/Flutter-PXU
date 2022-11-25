import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  List<String> _list = [
    'assets/images/Picture2.png',
    'assets/images/Picture3.png',
    'assets/images/Picture4.png',
    'assets/images/Picture5.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 30, right: 30, top: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildListIcon(context),
              SizedBox(
                height: 40,
              ),
              buildWelcome(context),
              SizedBox(
                height: 40,
              ),
              buildSearch(context),
              SizedBox(
                height: 40,
              ),
              buildSavePlacesText(context),
              // buildListView(context),
              buildGridView(context),
            ],
          ),
        ),
      ),
    );
  }

  buildListIcon(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        IconButton(onPressed: () {}, icon: Icon(Icons.notifications)),
        IconButton(onPressed: () {}, icon: Icon(Icons.extension)),
      ],
    );
  }

  buildWelcome(BuildContext context) {
    return RichText(
      text: TextSpan(
          text: "Welcome",
          style: TextStyle(
              fontWeight: FontWeight.bold, color: Colors.black, fontSize: 50),
          children: [
            TextSpan(
                text: "Tan", style: TextStyle(fontWeight: FontWeight.normal))
          ]),
    );
  }

  buildSearch(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
          hintText: "Search",
          prefixIcon: Icon(Icons.search),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)))),
    );
  }

  buildSavePlacesText(BuildContext context) {
    return const Text(
      "Save Places",
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
    );
  }

  buildGridView(BuildContext context) {
    return Expanded(
      child: GridView.count(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        children: [
          ..._list.map((e) {
            return Container(
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                  image: DecorationImage(
                    image: AssetImage(e),
                    fit: BoxFit.cover,
                  )),
            );
          })
        ],
      ),
    );
  }

  // buildGridView(BuildContext context) {}
  buildListView(BuildContext context) {
    return Expanded(
      child: ListView(
        scrollDirection: Axis.vertical,
        children: [
          ..._list.map((e) {
            return Container(
              margin: EdgeInsets.all(10),
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                  image: DecorationImage(
                    image: AssetImage(e),
                    fit: BoxFit.cover,
                  )),
            );
          })
        ],
      ),
    );
  }
}
