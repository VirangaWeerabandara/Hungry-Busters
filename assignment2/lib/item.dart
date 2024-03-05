import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class Item extends StatefulWidget {
  const Item({super.key});

  @override
  State<Item> createState() => _ItemState();
}

class _ItemState extends State<Item> {
  final List<String> _iconsPath = [
    'assets/images/dish1.png',
    'assets/images/dish2.png',
    'assets/images/dish1.png',
    'assets/images/dish2.png',
    'assets/images/dish1.png',
    'assets/images/dish2.png',
  ];
  @override
  Widget build(BuildContext context) {
    Color iconColor = const Color.fromRGBO(187, 183, 183, 1);
    IconData iconStyle = Icons.favorite_border;
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: screenHeight * 0.4,
            width: screenWidth,
            child: Image.asset('assets/images/pasta2.png', fit: BoxFit.cover),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: SizedBox(
              height: screenHeight * 0.5,
              width: screenWidth,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        width: screenWidth * 0.08,
                      ),
                      const Text('Pasta Mozzarella',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Color.fromRGBO(238, 81, 81, 1))),
                      SizedBox(
                        width: screenWidth * 0.25,
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            // Change icon color on tap
                            iconColor = const Color.fromRGBO(238, 81, 81, 1);
                            iconStyle = Icons.favorite;
                          });
                        },
                        child: Icon(
                          iconStyle,
                          color: iconColor,
                        ),
                      ),
                      SizedBox(
                        width: screenWidth * 0.1,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: screenWidth * 0.09,
                      ),
                      const Text(
                        'Non Veg Classic Meat',
                        textAlign: TextAlign.left,
                        style:
                            TextStyle(fontSize: 14, color: Color(0xFF817E7E)),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: screenHeight * 0.01,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: screenWidth * 0.08,
                      ),
                      RatingBar.builder(
                          initialRating: 4.5,
                          minRating: 0,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemSize: 20,
                          itemBuilder: (context, _) {
                            return const Icon(Icons.star,
                                color: Color.fromRGBO(238, 81, 81, 1));
                          },
                          onRatingUpdate: (rating) {}),
                      const Text('4.5',
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Color.fromRGBO(109, 108, 108, 0.8))),
                      SizedBox(
                        width: screenWidth * 0.24,
                      ),
                      const Text('1850 LKR',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Color.fromRGBO(238, 81, 81, 1))),
                    ],
                  ),
                  SizedBox(
                    height: screenHeight * 0.03,
                  ),
                  Container(
                    width: screenWidth * 0.9,
                    height: screenHeight * 0.065,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: const Color.fromRGBO(238, 81, 81, 1)),
                    child: TextButton(
                        onPressed: () {},
                        child: const Text(
                          'Add to Bag',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        )),
                  ),
                  SizedBox(
                    height: screenHeight * 0.02,
                  ),
                  const Text.rich(
                    TextSpan(
                        text: 'Pasta Mozzarella',
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF817E7E)),
                        children: [
                          TextSpan(
                            text:
                                '  is a unique blend of cheesy goodness and fluffy flaky pasta richness. Pasta Mozzarella is served with your choice of protein or vegetable and any topping of the selected classic and spicy ranges* ',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.normal,
                              color: Color(0xFF817E7E),
                            ),
                          ),
                        ]),
                  ),
                  SizedBox(
                    height: screenHeight * 0.01,
                  ),
                  const Row(
                    children: [
                      Text('Portion serves two*',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.normal,
                              color: Color(0xFF817E7E))),
                    ],
                  ),
                  SizedBox(
                    height: screenHeight * 0.01,
                  ),
                  const Divider(
                    color: Color(0xFFBBB7B7),
                  ),
                  SizedBox(
                    height: screenHeight * 0.01,
                  ),
                  const Row(
                    children: [
                      Text('You may also like',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.normal,
                              color: Color(0xFF817E7E))),
                    ],
                  ),
                  SizedBox(
                    height: screenHeight * 0.01,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: _iconsPath.map((iconPath) {
                        return Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Image.asset(
                                iconPath,
                                width: screenWidth * 0.2,
                                height: screenHeight * 0.08,
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(
                              width: screenWidth * 0.03,
                            ),
                          ],
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
