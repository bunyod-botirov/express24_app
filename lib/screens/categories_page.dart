import 'package:flutter/material.dart';
import 'package:express24/database/categories.dart';

class CategoriesPage extends StatefulWidget {
  const CategoriesPage({Key? key, required this.data}) : super(key: key);
  final Map data;

  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF0F0F0),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        title: Text(widget.data["category"]),
      ),
      body: widget.data["inside"].isEmpty
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
                      "У вас нет избранных заведений",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                      ),
                    ),
                    Icon(
                      Icons.no_meals,
                      color: Colors.grey,
                      size: 150,
                    ),
                  ],
                ),
              ),
            )
          : ListView.separated(
              padding: EdgeInsets.fromLTRB(
                MediaQuery.of(context).size.width * 0.05,
                MediaQuery.of(context).size.width * 0.05,
                MediaQuery.of(context).size.width * 0.05,
                MediaQuery.of(context).size.width * 0.05,
              ),
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  height: MediaQuery.of(context).size.height * 0.45,
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
                          widget.data["inside"][index]["image"],
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
                                  widget.data["inside"][index]["name"],
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                IconButton(
                                  icon: Icon(
                                    Icons.favorite_border,
                                    size: 28,
                                    color: widget.data["inside"][index]
                                            ["isFavourite"]
                                        ? Colors.red
                                        : Colors.black,
                                  ),
                                  onPressed: () {
                                    if (widget.data["inside"][index]
                                            ["isFavourite"] ==
                                        true) {
                                      widget.data["inside"][index]
                                          ["isFavourite"] = false;
                                      categories[0]["inside"]
                                          .remove(widget.data["inside"][index]);
                                    } else {
                                      widget.data["inside"][index]
                                          ["isFavourite"] = true;
                                      categories[0]["inside"]
                                          .add(widget.data["inside"][index]);
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
                                  widget.data["inside"][index]["rate"],
                                  style: const TextStyle(
                                    color: Colors.black54,
                                  ),
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.005,
                                ),
                                Text(
                                  "(${widget.data["inside"][index]["voted_number"]})",
                                  style: const TextStyle(color: Colors.black54),
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.02,
                                ),
                                const Icon(
                                  Icons.directions_car_filled_outlined,
                                  color: Colors.black54,
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.005,
                                ),
                                Text(
                                  widget.data["inside"][index]
                                      ["delivery_price"],
                                  style: const TextStyle(color: Colors.black54),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(
                  height: MediaQuery.of(context).size.width * 0.05,
                );
              },
              itemCount: widget.data["inside"].length,
            ),
    );
  }
}
