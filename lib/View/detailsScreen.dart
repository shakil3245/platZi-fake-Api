import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatefulWidget {
  DetailsScreen(
      {Key? key,
      required this.title,
      required this.price,
      required this.description,
      required this.images})
      : super(key: key);
  String title;
  String price;
  String description;
  String images;

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Details"),
        backgroundColor: Colors.orange,
      ),
      body: Column(
        children: [
          Container(
            height: 250,
            decoration: BoxDecoration(color: Colors.deepPurpleAccent),
            child: FancyShimmerImage(
              height: MediaQuery.sizeOf(context).height * 0.1,
              width: double.infinity,
              imageUrl: widget.images,
              boxFit: BoxFit.cover,
              errorWidget: Icon(Icons.error_outline_sharp,color: Colors.red,),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.title,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  "\$ " + widget.price,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(widget.description)
              ],
            ),
          )
        ],
      ),
    );
  }
}
