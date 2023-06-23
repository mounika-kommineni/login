import 'package:dodo/cart_page.dart';
import 'package:dodo/category/ac_page.dart';
import 'package:dodo/category/appliances.dart';
import 'package:dodo/category/cleaning.dart';
import 'package:dodo/category/eletrician.dart';
import 'package:dodo/category/food.dart';
import 'package:dodo/category/painting.dart';
import 'package:dodo/category/pest_control.dart';
import 'package:dodo/reuseable.dart';
import 'package:flutter/material.dart';
import 'package:dodo/category/plumbing.dart';
import 'package:dodo/category/carpenter.dart';
import 'dart:async';

void main() {
  runApp(HomePage());
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    // Start the timer when the widget is initialized
    _startTimer();
  }

  @override
  void dispose() {
    _pageController.dispose();
    _timer?.cancel(); // Cancel the timer when disposing the widget
    super.dispose();
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 5), (timer) {
      // Calculate the next page index
      final nextPage = (_currentPage + 1) % 3;
      // Animate to the next page
      _pageController.animateToPage(
        nextPage,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    });
  }

  void _onPageChanged(int page) {
    setState(() {
      _currentPage = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text('Dodo Booker'),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.search),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 200,
                child: PageView(
                  controller: _pageController,
                  onPageChanged: _onPageChanged,
                  children: [
                    Image.asset(
                      'assets/images/dodo booker logo.png',
                      fit: BoxFit.cover,
                    ),
                    Image.asset(
                      'assets/images/banner1.jpg',
                      fit: BoxFit.cover,
                    ),
                    Image.asset(
                      'assets/images/banner2.png',
                      fit: BoxFit.cover,
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List<Widget>.generate(3, (int index) {
                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    width: _currentPage == index ? 10.0 : 8.0,
                    height: 8.0,
                    margin: const EdgeInsets.symmetric(horizontal: 4.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _currentPage == index ? Colors.blue : Colors.grey,
                    ),
                  );
                }),
              ),
              const Padding(
                padding: EdgeInsets.all(16),
                child: Text(
                  'Which Service do you need?',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Container(
                height: 400,
                child: GridView.count(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  crossAxisCount: 3,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => const Plumbing()),
                        );
                      },
                      child: ServiceCard(
                        serviceName: 'Plumbing',
                        imageUrl: 'assets/images/plumber.png',
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => const CarpenterPage()),
                        );
                      },
                      child: ServiceCard(
                        serviceName: 'Carpenter',
                        imageUrl: 'assets/images/carpenter.png',
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => const Eletrician()),
                        );
                      },
                      child: ServiceCard(
                        serviceName: 'Electrician',
                        imageUrl: 'assets/images/eletrician.png',
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => const AcPage()),
                        );
                      },
                      child: ServiceCard(
                        serviceName: 'AC Services',
                        imageUrl: 'assets/images/ac.png',
                      ),
                    ),
                    GestureDetector(
                       onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => const Cleaning()),
                        );
                      },
                      child: ServiceCard(
                        serviceName: 'Cleaning Services',
                        imageUrl: 'assets/images/cleaning.png',
                      ),
                    ),
                    GestureDetector(
                       onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => const PestControl()),
                        );
                      },
                      child: ServiceCard(
                        serviceName: 'Pest Control',
                        imageUrl: 'assets/images/pestcontrol.png',
                      ),
                    ),
                    GestureDetector(
                       onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => const HomeAppliances()),
                        );
                      },
                      child: ServiceCard(
                        serviceName: 'Home Appliances',
                        imageUrl: 'assets/images/appliances.png',
                      ),
                    ),
                    GestureDetector(
                       onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => const Painting()),
                        );
                      },
                      child: ServiceCard(
                        serviceName: 'Painting Services',
                        imageUrl: 'assets/images/painting.png',
                      ),
                    ),
                    GestureDetector(
                       onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => const FoodPage()),
                        );
                      },
                      child: ServiceCard(
                        serviceName: 'Food Delivery',
                        imageUrl: 'assets/images/food.png',
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon: Icon(Icons.home),
                onPressed: () {
                  // Handle home button press
                },
              ),
              IconButton(
                icon: Icon(Icons.person),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.shopping_cart),
                onPressed: () {
                  Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => const CartPage()),
                        );
                },
              ),
            ],
          ),
        ),
      ),
      
    );
    
  }
}
