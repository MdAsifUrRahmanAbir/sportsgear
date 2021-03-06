import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sports_gear/screens/amdani/product_details_screen.dart';
import 'package:sports_gear/screens/amdani/search_screen.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late List<String> _carouselImages = [];
  late var _dotPosition = 0;
  late List _products = [];
  late var _firestoreInstance = FirebaseFirestore.instance;

  fetchCarouselImages() async {
    QuerySnapshot qn = await _firestoreInstance.collection("carousel-slider").get();
    setState(() {
      for (int i = 0; i < qn.docs.length; i++) {
        _carouselImages.add(
          qn.docs[i]["img-path"],
        );
        print(qn.docs[i]["img-path"]);
      }
    });

    return qn.docs;
  }

  fetchProducts() async {
    QuerySnapshot qn = await _firestoreInstance.collection("products").get();
    setState(() {
      for (int i = 0; i < qn.docs.length; i++) {
        _products.add({
          "product-name": qn.docs[i]["product-name"],
          "product-description": qn.docs[i]["product-description"],
          "product-price": qn.docs[i]["product-price"],
          "product-img": qn.docs[i]["product-img"],
        });
      }
    });

    return qn.docs;
  }

  @override
  void initState() {
    fetchCarouselImages();
    fetchProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: TextFormField(
                    readOnly: true,
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(0)),
                          borderSide: BorderSide(color: Colors.blue)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(0)),
                          borderSide: BorderSide(color: Colors.grey)),
                      hintText: "Search products here",
                      hintStyle: TextStyle(fontSize: 15),
                    ),
                    onTap: () => Navigator.push(context, CupertinoPageRoute(builder: (_) => SearchScreen())),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),

                AspectRatio(
                  aspectRatio: 3.5,
                  child: CarouselSlider(
                      items: _carouselImages
                          .map((item) => Padding(
                        padding: const EdgeInsets.only(left: 3, right: 3),
                        child: Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(item),
                                  fit: BoxFit.fitWidth)),
                        ),
                      ))
                          .toList(),
                      options: CarouselOptions(
                          autoPlay: false,
                          enlargeCenterPage: true,
                          viewportFraction: 0.8,
                          enlargeStrategy: CenterPageEnlargeStrategy.height,
                          onPageChanged: (val, carouselPageChangedReason) {
                            setState(() {
                              _dotPosition = val;
                            });
                          })),
                ),
                SizedBox(
                  height: 10,
                ),
                DotsIndicator(
                  dotsCount:
                  _carouselImages.length == 0 ? 1 : _carouselImages.length,
                  position: _dotPosition.toDouble(),
                  decorator: DotsDecorator(
                    activeColor: Colors.blue,
                    color: Colors.white,
                    spacing: EdgeInsets.all(2),
                    activeSize: Size(8, 8),
                    size: Size(6, 6),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Expanded(
                  child: GridView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: _products.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2, childAspectRatio: 1),
                      itemBuilder: (_, index) {
                        return GestureDetector(
                          onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (_)=>ProductDetails(_products[index]))),
                          child: Card(
                            elevation: 3,
                            child: Column(
                              children: [
                                Container(
                                  height: 150,
                                    width: 150,
                                    color: Colors.white,
                                    child: Image.network(
                                      _products[index]["product-img"][0],
                                      fit: BoxFit.contain,
                                      height: 150,
                                      width: 100,
                                    )),
                                Text("${_products[index]["product-name"]}"),
                                Text("${_products[index]["product-price"].toString()}"),
                              ],
                            ),
                          ),
                        );
                      }),
                ),

              ],
            ),
        ),
      ),
    );
  }
}
