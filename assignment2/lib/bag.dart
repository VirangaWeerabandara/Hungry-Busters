import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class Bag extends StatefulWidget {
  const Bag({super.key});

  @override
  State<Bag> createState() => _BagState();
}

class _BagState extends State<Bag> {
  final List<int> _count = [1, 1, 1, 1, 1, 1];
  final List<String> _imagePath = [
    'assets/images/burger.png',
    'assets/images/burger.png',
    'assets/images/pasta.png',
    'assets/images/burger.png',
  ];
  final List<String> _name = [
    'Tex Mex BBQ',
    'Twin Burger',
    'Pasta Mozzarella',
    'Tex Mex BBQ',
  ];
  final List<double> _rating = [
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
  ];

  @override
  Widget build(BuildContext context) {
    Color iconColor = const Color.fromRGBO(238, 81, 81, 1);
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: screenHeight * 0.1,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: screenWidth * 0.04,
              ),
              const Text('Order Summery',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(238, 81, 81, 1))),
            ],
          ),
          SizedBox(
            height: screenHeight * 0.63,
            width: screenWidth,
            child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: _name.length,
                itemBuilder: (context, index) {
                  return ClipRRect(
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
                              width: screenWidth * 0.38,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    _name[index],
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromRGBO(109, 108, 108, 0.8),
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
                                            return const Icon(Icons.star,
                                                color: Color.fromRGBO(
                                                    238, 81, 81, 1));
                                          },
                                          onRatingUpdate: (rating) {}),
                                      Text(_rating[index].toString(),
                                          style: const TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                              color: Color.fromRGBO(
                                                  109, 108, 108, 0.8))),
                                    ],
                                  ),
                                  Text(
                                    '${_price[index]} LKR',
                                    style: const TextStyle(
                                        fontSize: 11,
                                        fontWeight: FontWeight.bold,
                                        color: Color.fromRGBO(238, 81, 81, 1)),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 8.0, bottom: 8),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Row(
                                    children: [
                                      IconButton(
                                        icon: const Icon(
                                            Icons.remove_circle_outline),
                                        color: iconColor,
                                        iconSize: 20,
                                        onPressed: () {
                                          setState(() {
                                            if (_count[index] > 1) {
                                              _count[index]--;
                                            }
                                          });
                                        },
                                      ),
                                      SizedBox(
                                        width: screenWidth * 0.02,
                                        child: Text(
                                          '${_count[index]}',
                                          textAlign: TextAlign.center,
                                          style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              color: Color.fromRGBO(
                                                  109, 108, 108, 0.8)),
                                        ),
                                      ),
                                      IconButton(
                                        icon: const Icon(
                                            Icons.add_circle_outline),
                                        color: iconColor,
                                        iconSize: 20,
                                        onPressed: () {
                                          setState(() {
                                            _count[index]++;
                                          });
                                        },
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
          ),
          SizedBox(
            height: screenHeight * 0.02,
          ),
          Container(
            width: screenWidth * 0.9,
            height: screenHeight * 0.065,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: const Color.fromRGBO(238, 81, 81, 1)),
            child: TextButton(
                onPressed: () {
                  _popUp(context);
                },
                child: const Text(
                  'Checkout',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                )),
          ),
        ],
      ),
    ));
  }

  Future<void> _popUp(BuildContext context) async {
    double screenHeight = MediaQuery.of(context).size.height;
    await showModalBottomSheet(
        context: context,
        builder: (
          BuildContext context,
        ) {
          return Container(
            height: screenHeight * 0.5,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20))),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: screenHeight * 0.05,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text('Order  ',
                          style: TextStyle(
                              fontSize: 14, color: Color(0xFF6D6C6C))),
                      Text(' 9400 LKR',
                          style:
                              TextStyle(fontSize: 14, color: Color(0xFF6D6C6C)))
                    ],
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text('Shipping',
                          style: TextStyle(
                              fontSize: 14, color: Color(0xFF6D6C6C))),
                      Text('300 LKR',
                          style:
                              TextStyle(fontSize: 14, color: Color(0xFF6D6C6C)))
                    ],
                  ),
                  SizedBox(
                    height: screenHeight * 0.02,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text('Total  ',
                          style: TextStyle(
                              fontSize: 16,
                              color: Color(0xFF6D6C6C),
                              fontWeight: FontWeight.bold)),
                      Text('300 LKR',
                          style: TextStyle(
                              fontSize: 16,
                              color: Color(0xFF6D6C6C),
                              fontWeight: FontWeight.bold))
                    ],
                  ),
                  SizedBox(
                    height: screenHeight * 0.03,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 65, left: 65),
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color.fromRGBO(219, 216, 216, 1)),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Color(0xFFDBD8D8)),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        labelText: 'Apply Coupon Code',
                        labelStyle: const TextStyle(
                            fontSize: 14, color: Color(0xFFDBD8D8)),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: screenHeight * 0.02,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Text(' Address',
                          style: TextStyle(
                              fontSize: 16,
                              color: Color(0xFF6D6C6C),
                              fontWeight: FontWeight.bold)),
                      TextButton(
                          onPressed: () {},
                          child: const Text(
                            'Change',
                            style: TextStyle(
                                fontSize: 12,
                                color: Color.fromRGBO(238, 81, 81, 1),
                                fontWeight: FontWeight.bold),
                          )),
                    ],
                  ),
                  SizedBox(
                    height: screenHeight * 0.005,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Text(
                        'Victoria Higgins',
                        style:
                            TextStyle(fontSize: 14, color: Color(0xFF6D6C6C)),
                      ),
                      SizedBox(
                        width: screenHeight * 0.01,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Text(
                        '34 D4,Rose Ave, ',
                        style:
                            TextStyle(fontSize: 14, color: Color(0xFF6D6C6C)),
                      ),
                      SizedBox(
                        width: screenHeight * 0.01,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Text(
                        'Texas                 ',
                        style:
                            TextStyle(fontSize: 14, color: Color(0xFF6D6C6C)),
                      ),
                      SizedBox(
                        width: screenHeight * 0.01,
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Text('Payment Method',
                          style: TextStyle(
                              fontSize: 16,
                              color: Color(0xFF6D6C6C),
                              fontWeight: FontWeight.bold)),
                      TextButton(
                          onPressed: () {},
                          child: const Text(
                            'Change',
                            style: TextStyle(
                                fontSize: 12,
                                color: Color.fromRGBO(238, 81, 81, 1),
                                fontWeight: FontWeight.bold),
                          )),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: screenHeight * 0.075,
                      ),
                      const Icon(
                        Icons.credit_card,
                        color: Colors.black,
                      ),
                      const Text('.... .... .... 4656',
                          style: TextStyle(
                              fontSize: 14, color: Color(0xFF6D6C6C))),
                    ],
                  ),
                ],
              ),
            ),
          );
        });
  }
}
