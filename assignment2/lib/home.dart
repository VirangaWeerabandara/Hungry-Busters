import 'package:assignment2/item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<String> _iconsPath = [
    'assets/images/card1.png',
    'assets/images/card1.png',
    'assets/images/card1.png',
    'assets/images/card1.png'
  ];
  final List<IconData> _icons = [
    Icons.fastfood,
    Icons.local_pizza,
    Icons.restaurant,
    Icons.local_dining,
    Icons.local_bar,
    Icons.local_cafe,
    Icons.local_drink,
    Icons.local_pizza,
  ];
  final List<String> _imagePath = [
    'assets/images/burger.png',
    'assets/images/burger.png',
    'assets/images/pasta.png',
    'assets/images/burger.png',
    'assets/images/burger.png',
    'assets/images/pasta.png',
  ];
  final List<String> _name = [
    'Tex Mex BBQ',
    'Twin Burger',
    'Pasta Mozzarella',
    'Tex Mex BBQ',
    'Twin Burger',
    'Past Mozzarella',
  ];
  final List<String> _type = [
    'Non Veg Classic Meat',
    'Non Veg Burgers',
    'Non Veg Classic Meat',
    'Non Veg Burgers',
    'Non Veg Classic Meat',
    'Non Veg Burgers',
  ];
  final List<double> _rating = [
    4.5,
    4.5,
    4.5,
    4.5,
    4.5,
    4.5,
  ];
  final List<double> _price = [
    2400,
    1400,
    1850,
    2000,
    2300,
    1500,
  ];
  final List<int> _status = [0, 0, 0, 0, 0, 0];

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: FractionallySizedBox(
            widthFactor: 1,
            heightFactor: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: screenWidth * 0.03,
                    ),
                    const Icon(Icons.menu,
                        color: Color.fromRGBO(238, 81, 81, 1)),
                    SizedBox(
                      width: screenWidth * 0.3,
                    ),
                    const Text.rich(TextSpan(
                        text: 'Good Afternoon ',
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                        children: [
                          TextSpan(
                              text: 'Victoria !',
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold))
                        ])),
                    Stack(children: [
                      const ClipOval(
                        child: Image(
                          image: AssetImage('assets/images/profile.jpg'),
                          fit: BoxFit.cover,
                          width: 40,
                          height: 40,
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        left: 0,
                        child: Container(
                          width: 10,
                          height: 10,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color.fromRGBO(238, 81, 81, 1),
                          ),
                        ),
                      ),
                    ])
                  ],
                ),
                SizedBox(
                  height: screenHeight * 0.03,
                ),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Search Meals',
                    hintStyle: const TextStyle(
                        color: Color.fromRGBO(109, 108, 108, 0.5)),
                    prefixIcon: const Icon(
                      Icons.search,
                      color: Color.fromRGBO(109, 108, 108, 0.5),
                    ),
                    filled: true,
                    fillColor: const Color.fromRGBO(239, 237, 237, 1),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: const BorderSide(
                            color: Color.fromRGBO(239, 237, 237, 1))),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: const BorderSide(
                            color: Color.fromRGBO(239, 237, 237, 1))),
                  ),
                ),
                SizedBox(
                  height: screenHeight * 0.03,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: _iconsPath.map((iconPath) {
                      return Row(
                        children: [
                          Container(
                            width: screenWidth * 0.75,
                            height: screenHeight * 0.2,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Image.asset(iconPath, fit: BoxFit.cover),
                          ),
                          SizedBox(
                            width: screenWidth * 0.03,
                          ),
                        ],
                      );
                    }).toList(),
                  ),
                ),
                SizedBox(
                  height: screenHeight * 0.02,
                ),
                SizedBox(
                  height: screenHeight * 0.04,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: _icons.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(
                              right: 20.0, left: 20, bottom: 20),
                          child: Icon(
                            _icons[index],
                            color: const Color.fromRGBO(238, 81, 81, 1),
                            size: 30,
                          ),
                        );
                      }),
                ),
                SizedBox(
                  height: screenHeight * 0.002,
                ),
                SizedBox(
                  height: screenHeight * 0.4,
                  child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: _name.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            // print('Tapped');
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Item()));
                          },
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Material(
                              elevation: 100,
                              borderOnForeground: true,
                              child: SizedBox(
                                height: screenHeight * 0.1,
                                child: Row(
                                  children: [
                                    Container(
                                      width: screenWidth * 0.3,
                                      height: screenHeight * 0.09,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: Image.asset(_imagePath[index],
                                          fit: BoxFit.fill),
                                    ),
                                    SizedBox(
                                      width: screenWidth * 0.03,
                                    ),
                                    SizedBox(
                                      width: screenWidth * 0.4,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            _name[index],
                                            style: const TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                              color: Color.fromRGBO(
                                                  109, 108, 108, 0.8),
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              RatingBar.builder(
                                                  initialRating: _rating[index],
                                                  minRating: 0,
                                                  direction: Axis.horizontal,
                                                  allowHalfRating: true,
                                                  itemCount: 5,
                                                  itemSize: 20,
                                                  itemBuilder: (context, _) {
                                                    return const Icon(
                                                        Icons.star,
                                                        color: Color.fromRGBO(
                                                            238, 81, 81, 1));
                                                  },
                                                  onRatingUpdate: (rating) {}),
                                              Text(_rating[index].toString(),
                                                  style: const TextStyle(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Color.fromRGBO(
                                                          109, 108, 108, 0.8))),
                                            ],
                                          ),
                                          Text(_type[index],
                                              style: const TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.bold,
                                                  color: Color.fromRGBO(
                                                      109, 108, 108, 0.8))),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 8.0, bottom: 8),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          IconButton(
                                            // ignore: unrelated_type_equality_checks
                                            icon: Icon(
                                                _status[index] == 1
                                                    ? Icons.favorite
                                                    : Icons
                                                        .favorite_border_outlined,

                                                // ignore: unrelated_type_equality_checks
                                                color: _status[index] == 1
                                                    ? const Color.fromRGBO(
                                                        238, 81, 81, 1)
                                                    : null),
                                            onPressed: () {
                                              setState(() {
                                                // Change icon color on tap
                                                if (_status[index] == 1) {
                                                  _status[index] = 0;
                                                } else {
                                                  _status[index] = 1;
                                                }
                                              });
                                            },
                                          ),
                                          SizedBox(
                                            height: screenHeight * 0.008,
                                          ),
                                          Text(
                                            '${_price[index]} LKR',
                                            style: const TextStyle(
                                                fontSize: 11,
                                                fontWeight: FontWeight.bold,
                                                color: Color.fromRGBO(
                                                    238, 81, 81, 1)),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                ),
              ],
            ),
          )),
    );
  }
}
