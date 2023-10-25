import 'package:flutter/material.dart';
import 'dart:async';

class ImageCarousel2 extends StatefulWidget {
  @override
  const ImageCarousel2(
      {Key? key,
      //  required this.flag,
        //  required this.fontSize,
      })
      : super(key: key);
//  final bool flag;
  _ImageCarouselState createState() => _ImageCarouselState();
}

class _ImageCarouselState extends State<ImageCarousel2> {
  int currentImageIndex = 0;

  List<String> imageUrls = [
    'images/books.jpg',
    'images/cute.jpg',
    'images/word.jpg',
    'images/reading.jpg',
  ];
  late Timer timer;
  @override
  void initState() {
    super.initState();
    // Start a timer to change the image every 1 second
    timer = Timer.periodic(Duration(seconds: 2), (timer) {
      setState(() {
        currentImageIndex = (currentImageIndex + 1) % imageUrls.length;
      });
    });
  }

  @override
  void dispose() {
    timer.cancel(); // Cancel the timer to avoid memory leaks
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var Iwidgth = MediaQuery.of(context).size.width*0.4;
    var Iheight = MediaQuery.of(context).size.height*0.3;
    return Container(
      child: Image.asset(imageUrls[currentImageIndex],
        width: Iwidgth, // Set the desired width
        height: Iheight, // Set the desired height),
      ),
    );
  }
}