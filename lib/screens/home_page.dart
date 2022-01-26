import 'package:flutter/material.dart';
import 'package:express24/database/categories.dart';
import 'package:express24/screens/categories_page.dart';
import 'package:express24/database/images.dart';
import 'package:express24/database/restaurants.dart';
import 'package:express24/screens/product_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _dropdownValue = "Tashkent";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF0F0F0),
      body: CustomScrollView(
        slivers: <Widget>[
          appBar(context),
          categoriesInTheMiddle(context),
          bottomList(),
        ],
      ),
    );
  }

  SliverAppBar appBar(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.white,
      floating: true,
      centerTitle: true,
      title: DropdownButtonHideUnderline(
        child: DropdownButton(
          value: _dropdownValue,
          icon: const Icon(Icons.keyboard_arrow_down_rounded),
          items: const <DropdownMenuItem<String>>[
            DropdownMenuItem(
              child: Text("Tashkent"),
              value: "Tashkent",
            ),
            DropdownMenuItem(
              child: Text("Andijon"),
              value: "Andijon",
            ),
            DropdownMenuItem(
              child: Text("Farg'ona"),
              value: "Farg'ona",
            ),
            DropdownMenuItem(
              child: Text("Samarkand"),
              value: "Samarkand",
            ),
            DropdownMenuItem(
              child: Text("Buxoro"),
              value: "Buxoro",
            ),
            DropdownMenuItem(
              child: Text("Qashqadaryo"),
              value: "Qashqadaryo",
            ),
            DropdownMenuItem(
              child: Text("Surxondaryo"),
              value: "Surxondaryo",
            ),
          ],
          onChanged: (value) {
            _dropdownValue = value.toString();
            setState(() {});
          },
        ),
      ),
      bottom: PreferredSize(
        preferredSize: Size(
          MediaQuery.of(context).size.width,
          MediaQuery.of(context).size.height * 0.07,
        ),
        child: Container(
          height: MediaQuery.of(context).size.height * 0.06,
          margin: EdgeInsets.fromLTRB(
            MediaQuery.of(context).size.width * 0.05,
            0,
            MediaQuery.of(context).size.width * 0.05,
            MediaQuery.of(context).size.width * 0.04,
          ),
          decoration: BoxDecoration(
            color: const Color(0xFFF0F0F0),
            borderRadius: BorderRadius.circular(10),
          ),
          child: TextFormField(
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.search),
              isDense: true,
              labelText: "Поиск",
              floatingLabelBehavior: FloatingLabelBehavior.never,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(style: BorderStyle.none),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(style: BorderStyle.none),
              ),
            ),
          ),
        ),
      ),
    );
  }

  SliverToBoxAdapter categoriesInTheMiddle(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.6,
        child: Column(
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(top: 15, bottom: 7),
              height: MediaQuery.of(context).size.height * 0.12,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 6),
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        imagesTop[index],
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
                itemCount: 3,
              ),
            ),
            const ListTile(
              title: Text(
                "Магазины",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              trailing: Icon(
                Icons.arrow_forward_rounded,
                color: Colors.black,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 7),
              height: MediaQuery.of(context).size.height * 0.18,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 5),
                    width: MediaQuery.of(context).size.width * 0.4,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        ClipRRect(
                          borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(10),
                          ),
                          child: Image.network(
                            imagesBottom[index]["image"],
                            fit: BoxFit.cover,
                            height: MediaQuery.of(context).size.height * 0.13,
                          ),
                        ),
                        const Spacer(),
                        Text(
                          imagesBottom[index]["name"],
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          style: const TextStyle(fontSize: 16),
                        ),
                        const Spacer(),
                      ],
                    ),
                  );
                },
                itemCount: imagesBottom.length,
              ),
            ),
            const ListTile(
              title: Text(
                "Рестораны",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.07,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 15),
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    child: Chip(
                      labelPadding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 7,
                      ),
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      label: categories[index]["category"] != "Избранное"
                          ? Text(
                              categories[index]["category"],
                              style: const TextStyle(fontSize: 16),
                            )
                          : Row(
                              children: <Widget>[
                                const Icon(
                                  Icons.favorite,
                                  color: Colors.red,
                                ),
                                const SizedBox(width: 10),
                                Text(
                                  categories[index]["category"],
                                  style: const TextStyle(fontSize: 16),
                                ),
                              ],
                            ),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CategoriesPage(
                            data: categories[index],
                          ),
                        ),
                      );
                    },
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(width: 7);
                },
                itemCount: categories.length,
              ),
            ),
          ],
        ),
      ),
    );
  }

  SliverList bottomList() {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return InkWell(
            child: Container(
              height: MediaQuery.of(context).size.height * 0.45,
              margin: EdgeInsets.fromLTRB(
                MediaQuery.of(context).size.width * 0.05,
                0,
                MediaQuery.of(context).size.width * 0.05,
                MediaQuery.of(context).size.width * 0.05,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: <Widget>[
                  ClipRRect(
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(10),
                    ),
                    child: Image.network(
                      restaurants[index]["image"],
                      fit: BoxFit.cover,
                      height: MediaQuery.of(context).size.height * 0.28,
                      width: MediaQuery.of(context).size.width * 0.9,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    height: MediaQuery.of(context).size.height * 0.17,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              restaurants[index]["name"],
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            IconButton(
                              icon: Icon(
                                Icons.favorite_border,
                                size: 28,
                                color: restaurants[index]["isFavourite"]
                                    ? Colors.red
                                    : Colors.black,
                              ),
                              onPressed: () {
                                if (restaurants[index]["isFavourite"] == true) {
                                  restaurants[index]["isFavourite"] = false;
                                  categories[0]["inside"]
                                      .remove(restaurants[index]);
                                } else {
                                  restaurants[index]["isFavourite"] = true;
                                  categories[0]["inside"]
                                      .add(restaurants[index]);
                                }

                                setState(() {});
                              },
                            ),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            const Icon(
                              Icons.star_outline_rounded,
                              color: Colors.black54,
                            ),
                            Text(
                              restaurants[index]["rate"],
                              style: const TextStyle(
                                color: Colors.black54,
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.005,
                            ),
                            Text(
                              "(${restaurants[index]["voted_number"]})",
                              style: const TextStyle(color: Colors.black54),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.02,
                            ),
                            const Icon(
                              Icons.directions_car_filled_outlined,
                              color: Colors.black54,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.005,
                            ),
                            Text(
                              restaurants[index]["delivery_price"],
                              style: const TextStyle(color: Colors.black54),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            onTap: () async {
              await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductPage(
                    product: restaurants[index],
                  ),
                ),
              );
              setState(() {});
            },
          );
        },
        childCount: restaurants.length,
      ),
    );
  }
}
