
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:page_transition/page_transition.dart';

import '../View/detailsScreen.dart';

class product extends StatelessWidget {
      product({
    super.key, this.images, this.title, this.price,
  });

  final String? images;
  final String? title;
  final String? price;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(width: 150,decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: ClipRRect(
                child: FancyShimmerImage(
                  height: MediaQuery.sizeOf(context).height * 0.1,
                  width: double.infinity,
                  imageUrl: images!,
                  boxFit: BoxFit.cover,
                  errorWidget: Icon(Icons.error_outline_sharp,color: Colors.red,),
                ),
              ))),
          Text(title!,style: TextStyle(fontSize: 18),),
          Text("\$ "+ price!,style: TextStyle(fontSize: 14)),
        ],
      ),
    );
  }
}
