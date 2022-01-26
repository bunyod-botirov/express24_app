import 'package:flutter/material.dart';

class OrdersPage extends StatefulWidget {
 const OrdersPage({Key? key}) : super(key: key);

  @override
  State<OrdersPage> createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> with TickerProviderStateMixin {
  TabController? _tabbarController;

  @override
  void initState() {
    _tabbarController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF0F0F0),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text("Заказы"),
        bottom: TabBar(
          controller: _tabbarController,
          indicatorPadding: const EdgeInsets.symmetric(horizontal: 20),
          indicatorColor: const Color(0xFFFDE93E),
          indicatorWeight: 3,
          unselectedLabelColor: Colors.grey,
          tabs: const <Widget>[
            Tab(
              text: "АКТИВНЫЕ ЗАКАЗЫ",
            ),
            Tab(
              text: "ИСТОРИЯ ЗАКАЗОВ",
            ),
          ],
          onTap: (value) => setState(() {}),
        ),
      ),
      body: _tabbarController!.index == 0
          ? Center(
              child: Container(
                height: MediaQuery.of(context).size.height * 0.45,
                width: MediaQuery.of(context).size.width * 0.6,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const <Widget>[
                    Text(
                      "Список пуст",
                      style: TextStyle(
                        fontSize: 25,
                      ),
                    ),
                    Text(
                      "У вас нет активный заказов",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                      ),
                    ),
                    Icon(
                      Icons.no_food,
                      color: Colors.grey,
                      size: 150,
                    ),
                  ],
                ),
              ),
            )
          : Center(
              child: Container(
                height: MediaQuery.of(context).size.height * 0.45,
                width: MediaQuery.of(context).size.width * 0.6,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const <Widget>[
                    Text(
                      "История пусто",
                      style: TextStyle(
                        fontSize: 25,
                      ),
                    ),
                    Text(
                      "Ваша история пусто",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                      ),
                    ),
                    Icon(
                      Icons.shopping_cart,
                      color: Colors.grey,
                      size: 150,
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
