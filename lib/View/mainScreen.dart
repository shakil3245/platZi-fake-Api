import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:page_transition/page_transition.dart';

import '../Controller/productController.dart';
import '../widgets/productWidgets.dart';
import 'detailsScreen.dart';

class DemoApiApp extends StatefulWidget {
  const DemoApiApp({Key? key}) : super(key: key);

  @override
  State<DemoApiApp> createState() => _DemoApiAppState();
}

class _DemoApiAppState extends State<DemoApiApp> {
  ProductController _productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Demo Shop"),
      ),
      body: Column(
        children: [
          Expanded(
              child: FutureBuilder(
            future: _productController.getPostAPI(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Center(child: CircularProgressIndicator());
              } else {
                return GridView.builder(
                    itemCount: _productController.postList.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisSpacing: 0,
                        mainAxisSpacing: 0,
                        crossAxisCount: 2,
                        childAspectRatio: 0.9),
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              PageTransition(
                                  type: PageTransitionType.fade,
                                  child: DetailsScreen(
                                    title: snapshot.data![index].title!,
                                    price: snapshot.data![index].price!.toString(),
                                    description: snapshot.data![index].description!,
                                    images: snapshot.data![index].images![0],
                                  )));
                        },
                        child: product(
                          images:
                              _productController.postList[index].images![0],
                          title: _productController.postList[index].title
                              .toString(),
                          price: _productController.postList[index].price
                              .toString(),
                        ),
                      );
                    });
              }
            },
          ))
        ],
      ),
    );
  }
}
