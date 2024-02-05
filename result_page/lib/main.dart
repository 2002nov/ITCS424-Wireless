import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class ProductBox {
  final String name;
  final String image;

  ProductBox({
    required this.name,
    required this.image,
  });
}

class MyApp extends StatelessWidget {
final List<ProductBox> products = [
    ProductBox(
      name: "Movie 1",
      image: "result1.jpeg",
    ),
    ProductBox(
      name: "Movie 2",
      image: "result2.jpeg",
    ),
    ProductBox(
      name: "Movie 3",
      image: "result3.jpeg",
    ),
    ProductBox(
      name: "Movie 4",
      image: "result4.jpeg",
    ),
    ProductBox(
      name: "MMovie 5",
      image: "result5.jpeg",
    ),
    ProductBox(
      name: "Movie 6",
      image: "result6.jpeg",
    ),
    ProductBox(
      name: "Movie 7",
      image: "result7.jpeg",
    ),
    ProductBox(
      name: "Movie 8",
      image: "result8.jpeg",
    ),
    ProductBox(
      name: "Movie 9",
      image: "result9.jpeg",
    ),
    ProductBox(
      name: "Movie 10",
      image: "result10.jpeg",
    ),
];

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double appBarHeight = screenHeight * 0.15;

    return MaterialApp(
      title: "CINEMATE",
      home: Scaffold(
        appBar: AppBar(
          title: Text("CINEMATE", style: TextStyle(color: Colors.white, fontFamily: 'EncodeSansCondensed')),
          backgroundColor: Colors.black,
          actions: [
            IconButton(
              icon: Icon(Icons.search, color: Colors.white),
              onPressed: () {
                print('search button pressed');
              },
            )
          ],
          leading: IconButton(
            icon: Icon(Icons.menu, color: Colors.white),
            onPressed: () {
              print('Menu button pressed');
            },
          ),
        ),
        backgroundColor: Colors.black,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text("Result for:   Barbie", style: TextStyle(color: Colors.white, fontSize: 22, fontFamily: 'EncodeSansCondensed')),
            ),
              //---------------------------------
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 1.0,
                  mainAxisSpacing: 70.0,
                ),
                itemCount: products.length,
                itemBuilder: (context, index) {
                  return ProductBoxWidget(product: products[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProductBoxWidget extends StatelessWidget {
  final ProductBox product;

  ProductBoxWidget({required this.product});

  @override
  Widget build(BuildContext context) {
    // Get the screen size
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    // Calculate the responsive size for Image.asset
    double imageHeight = screenHeight * 0.25;
    double imageWidth = screenWidth * 0.25;

    return Container(
      // padding: EdgeInsets.all(1.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10.0), // Set the same border radius
            child: Image.asset(
              product.image,
              height: imageHeight,
              width: imageWidth,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            padding: EdgeInsets.all(1.0),
            color: Colors.black, // Set the color to red
            child: SizedBox(
              width: imageWidth,
              height: 40.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    product.name,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 15, // Set the font size here
                      fontFamily: 'EncodeSansCondensed',
                    )
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}



