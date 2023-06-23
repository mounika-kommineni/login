import 'package:dodo/category/plumbinglist/sink_basin.dart';
import 'package:flutter/material.dart';
import 'package:dodo/reuseable.dart';
import 'package:dodo/category/plumbinglist/inspection.dart';

class Plumbing extends StatefulWidget {
  const Plumbing({Key? key}) : super(key: key);

  @override
  State<Plumbing> createState() => _PlumbingState();
}

class _PlumbingState extends State<Plumbing> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            height: 200,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/plumbing/banner.png'), // Replace with your transparent image path
                fit: BoxFit.cover,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(16),
            child: Center(
              child: Text(
                'Plumbing Repair and Services',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 3,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              children: [
                GestureDetector(
                  onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) =>  Inspection()),
                        );
                      },
                  child: CategoryCard(
                    categoryName: 'Inspection',
                    imageUrl: 'assets/images/plumbing/inspection.png',
                  ),
                ),
                GestureDetector(
                  onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) =>  BasinSinkPage()),
                        );
                      },
                  child: CategoryCard(
                    categoryName: 'Sink & Basin',
                    imageUrl: 'assets/images/plumbing/sink.jpg',
                  ),
                ),
                CategoryCard(
                  categoryName: 'Grouting',
                  imageUrl: 'assets/images/plumbing/grouting.png',
                ),
                CategoryCard(
                  categoryName: 'Bath Fittings',
                  imageUrl: 'assets/images/plumbing/bath.png',
                ),
                 CategoryCard(
                  categoryName: 'Drainage Pipes',
                  imageUrl: 'assets/images/plumbing/drainage.png',
                ),
                 CategoryCard(
                  categoryName: 'Tap & Mixer',
                  imageUrl: 'assets/images/plumbing/tap.png',
                ),
                 CategoryCard(
                  categoryName: 'Toilet',
                  imageUrl: 'assets/images/plumbing/toilet.png',
                ),
                CategoryCard(
                  categoryName: 'Water Tank',
                  imageUrl: 'assets/images/plumbing/watertank.png',
                ),
                CategoryCard(
                  categoryName: 'Motor',
                  imageUrl: 'assets/images/plumbing/motor.png',
                ),
                CategoryCard(
                  categoryName: 'Water Pipe Connections',
                  imageUrl: 'assets/images/plumbing/waterpipe.png',
                ),
                CategoryCard(
                  categoryName: 'Water Filter',
                  imageUrl: 'assets/images/plumbing/filter.png',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
