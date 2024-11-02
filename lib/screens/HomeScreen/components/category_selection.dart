import 'package:flutter/material.dart';
import 'package:newsapi/screens/HomeScreen/components/bbc_news.dart';
import 'package:newsapi/screens/HomeScreen/components/business.dart';
import 'package:newsapi/screens/HomeScreen/components/entertainment.dart';
import 'package:newsapi/screens/HomeScreen/components/general.dart';
import 'package:newsapi/screens/HomeScreen/components/tech_crunch.dart';
import 'package:newsapi/screens/HomeScreen/home_screen.dart';

class CategorySelection extends StatefulWidget {
  const CategorySelection({super.key});

  @override
  _CategorySelectionState createState() => _CategorySelectionState();
}

class _CategorySelectionState extends State<CategorySelection> {
  int selectedIndex = 0;
  // Keep track of the selected button index

  Widget categoryButton(String text, int index, navigation) {
    bool isSelected = selectedIndex == index;

    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => navigation));
        setState(() {
          selectedIndex = index; // Update selected button
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? Colors.blueAccent : Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 11),
          child: Center(
            child: Text(text,
                style: TextStyle(
                    color: isSelected ? Colors.white : Colors.black,
                    fontSize: 15)),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        scrollDirection: Axis.horizontal,
        children: [
          categoryButton('All', 0, const HomeScreen()),
          const Padding(padding: EdgeInsets.only(right: 10)),
          categoryButton('BBC', 1, const BbcNews()),
          const Padding(padding: EdgeInsets.only(right: 10)),
          categoryButton('Tech Crunch', 2, const TechCrunch()),
          const Padding(padding: EdgeInsets.only(right: 10)),
          categoryButton('General', 3, const General()),
          const Padding(padding: EdgeInsets.only(right: 10)),
          categoryButton('Entertainment', 4, const Entertainment()),
          const Padding(padding: EdgeInsets.only(right: 10)),
          categoryButton('Business', 5, const Business()),
        ],
      ),
    );
  }
}
