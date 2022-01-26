import 'package:flutter/material.dart';
import 'package:express24/database/categories.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({Key? key, required this.product}) : super(key: key);
  final Map product;

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage>
    with TickerProviderStateMixin {
  TabController? _tabbarController;

  @override
  void initState() {
    _tabbarController = TabController(length: 7, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF0F0F0),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: MediaQuery.of(context).size.height * 0.7,
            toolbarHeight: MediaQuery.of(context).size.height * 0.1,
            backgroundColor: Colors.white,
            pinned: true,
            leadingWidth: 40,
            leading: InkWell(
              child: const CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                ),
              ),
              onTap: () => Navigator.pop(context),
            ),
            title: Text(widget.product["name"]),
            actions: <Widget>[
              const CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.share_outlined,
                  color: Colors.black,
                ),
              ),
              SizedBox(width: MediaQuery.of(context).size.width * 0.01),
              const CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.search,
                  color: Colors.black,
                ),
              ),
            ],
            bottom: PreferredSize(
              child: Container(
                height: MediaQuery.of(context).size.height * 0.07,
                color: Colors.white,
                child: TabBar(
                  controller: _tabbarController,
                  isScrollable: true,
                  indicatorPadding: const EdgeInsets.symmetric(horizontal: 20),
                  indicatorColor: const Color(0xFFFDE93E),
                  indicatorWeight: 3,
                  unselectedLabelColor: Colors.grey,
                  tabs: const <Widget>[
                    Tab(
                      text: "НОВИНКИ",
                    ),
                    Tab(
                      text: "БЛЮДО",
                    ),
                    Tab(
                      text: "САЛАТЫ",
                    ),
                    Tab(
                      text: "ДЕТСКОЕ МЕНЮ",
                    ),
                    Tab(
                      text: "ДЕСЕРТЫ",
                    ),
                    Tab(
                      text: "ДОПОЛНЕНИЯ",
                    ),
                    Tab(
                      text: "НАПИТКИ",
                    ),
                  ],
                ),
              ),
              preferredSize: Size(
                0,
                MediaQuery.of(context).size.height * 0.05,
              ),
            ),
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                color: const Color(0xFFF0F0F0),
                child: Column(
                  children: <Widget>[
                    Image.network(
                      widget.product["image"],
                      height: MediaQuery.of(context).size.height * 0.3,
                      width: MediaQuery.of(context).size.width,
                      fit: BoxFit.cover,
                    ),
                    Container(
                      color: Colors.white,
                      child: ListTile(
                        dense: true,
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 15,
                        ),
                        title: Text(
                          widget.product["name"],
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 28,
                          ),
                        ),
                        subtitle: const Text(
                          "Минимальная сумма заказа 0 сум",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 16,
                          ),
                        ),
                        trailing: IconButton(
                          icon: Icon(
                            Icons.favorite_border,
                            color: widget.product["isFavourite"] == true
                                ? Colors.red
                                : Colors.black87,
                            size: 30,
                          ),
                          onPressed: () {
                            if (widget.product["isFavourite"] == true) {
                              widget.product["isFavourite"] = false;
                              categories[0]["inside"].remove(widget.product);
                            } else {
                              widget.product["isFavourite"] = true;
                              categories[0]["inside"].add(widget.product);
                            }

                            setState(() {});
                          },
                        ),
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.08,
                      margin: const EdgeInsets.all(10),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ListTile(
                        title: Text(
                          "Доставка ${widget.product["delivery_price"]}",
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          height: MediaQuery.of(context).size.height * 0.1,
                          width: MediaQuery.of(context).size.width * 0.45,
                          margin: const EdgeInsets.only(bottom: 10, left: 10),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const ListTile(
                            tileColor: Colors.transparent,
                            dense: true,
                            title: Text(
                              "40 - 60 мин",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            subtitle: Text(
                              "Время доставки",
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height * 0.1,
                          width: MediaQuery.of(context).size.width * 0.45,
                          margin: const EdgeInsets.only(bottom: 10, right: 10),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: ListTile(
                            tileColor: Colors.transparent,
                            dense: true,
                            title: Text(
                              "${widget.product["rate"]} (${widget.product["voted_number"]})",
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            subtitle: const Text(
                              "Рейтинг",
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(height: MediaQuery.of(context).size.height * 0.02),
          ),
          SliverGrid(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisExtent: MediaQuery.of(context).size.height * 0.3,
              mainAxisSpacing: MediaQuery.of(context).size.width * 0.03,
              crossAxisSpacing: MediaQuery.of(context).size.width * 0.03,
            ),
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Container(
                  margin: EdgeInsets.only(
                    left: index % 2 == 0 ? 10 : 0,
                    right: index % 2 != 0 ? 10 : 0,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      ClipRRect(
                        borderRadius: const BorderRadius.vertical(
                          top: Radius.circular(10),
                        ),
                        child: Image.network(
                          widget.product["menu"][index]["image"],
                          height: MediaQuery.of(context).size.height * 0.2,
                          width: MediaQuery.of(context).size.width,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.1,
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              widget.product["menu"][index]["name"],
                              style: const TextStyle(fontSize: 16),
                            ),
                            Text(
                              "${widget.product["menu"][index]["price"]} сум",
                              style: const TextStyle(
                                fontSize: 13,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
              childCount: widget.product["menu"].length,
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(height: MediaQuery.of(context).size.height * 0.02),
          ),
        ],
      ),
    );
  }
}
