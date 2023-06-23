import 'package:flutter/material.dart';

class Reuseable extends StatelessWidget {
  const Reuseable({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}


class ServiceCard extends StatelessWidget {
  final String serviceName;
  final String imageUrl;

  ServiceCard({required this.serviceName, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      // decoration: BoxDecoration(
      //    borderRadius: BorderRadius.circular(8),
      //  color: Colors.grey
      //        ),
      margin: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset(
                imageUrl,
                width: 100.0,
                height: 100.0,
                fit: BoxFit.cover,
              ),
            ),
          ),
         const SizedBox(height: 10),
          Center(
            child: Text(
              serviceName,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                ),
            ),
          ),
        ],
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  final String categoryName;
  final String imageUrl;

  CategoryCard({required this.categoryName, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      // decoration: BoxDecoration(
      //   borderRadius: BorderRadius.circular(8),
      //   color: Colors.grey,
      //),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            imageUrl,
            width: 110,
            height: 110,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 8.0),
          Center(
            child: Text(
              categoryName,
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}


class Cart {
  List<String> items = [];
  double totalPrice = 0;
  
  
  void addItem(String item) {
    items.add(item);
  }
   void addPrice(double price) {
    totalPrice += price;
  }

  void removeItem(String item) {
    items.remove(item);
  }

  void clearCart() {
    items.clear();
  }

  int get itemCount => items.length;

  
  List<Product> products = [];

  void addProduct({required String name, required double price, required int quantity}) {
    products.add(Product(name: name, price: price, quantity: quantity));
  }
}

class Product {
  final String name;
  final double price;
  final int quantity;

  Product({required this.name, required this.price, required this.quantity});
}




//Basin and sink
