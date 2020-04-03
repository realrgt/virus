import 'dart:math';

import 'package:flutter/material.dart';
import 'package:vogu/models/categories-services.dart';
import 'package:vogu/util/default_colors.dart';

class CategoriesScroll extends StatefulWidget {
  final int scrollItem;

  const CategoriesScroll({Key key, this.scrollItem}) : super(key: key);

  @override
  _CategoriesScrollState createState() => _CategoriesScrollState();
}

class _CategoriesScrollState extends State<CategoriesScroll> {
  // List of categoryImages
  List<String> _imgUrls = categories.map((c) => c.imgUrl).toList();

  int _selectedIndex = 0;

  //////////////////////////////////////
  List<Service> _serviceList;
  List<String> _categoryList;
  List<Service> selectedChoices = List();
  String _catName = "";

  _setColor() {
    Color color;
    int random = Random().nextInt(3);

    switch (random) {
      case 0:
        color = Colors.purple;
        break;
      case 1:
        color = Colors.purpleAccent;
        break;
      default:
        color = Colors.deepPurple;
    }

    return color;
  }

  @override
  Widget build(BuildContext context) {
    _serviceList = categories
        .where((c) => c.id == _selectedIndex)
        .expand((c) => c.services)
        .toList();
    _categoryList = categories
        .where((c) => c.id == _selectedIndex)
        .map((c) => c.categoryName)
        .toList();

    _categoryList.forEach(print);

    return Column(
      children: <Widget>[
        Container(
          height: 140.0,
          width: double.infinity,
          child: ListView(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.only(left: 50.0),
            children: _imgUrls.asMap().entries.map(
              (MapEntry map) {
                return _buildCircleImg(map.key);
              },
            ).toList(),
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 32.0),
          height: 200.0,
          width: MediaQuery.of(context).size.width,
          child: SingleChildScrollView(
            child: Wrap(
              alignment: WrapAlignment.spaceEvenly,
              spacing: 2.0,
              runSpacing: 0.0,
              children: _buildChipsList(),
            ),
          ),
        ),
      ],
    );
  }

  var temp2;
  Widget _buildCircleImg(int index) {
    Color _color = _setColor();

    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
        print('Selected index: $_selectedIndex');
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 5.0),
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  height: 85.0,
                  width: 85.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: _selectedIndex == index ? PINK : PURPLE_DEEP,
                  ),
                ),
                Positioned(
                  top: 5,
                  left: 5,
                  child: Container(
                    height: 75.0,
                    width: 75.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(37.5),
                      image: DecorationImage(
                        image: AssetImage(_imgUrls[index]),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 3.0),
            _selectedIndex == index
                ? Column(
                    children: <Widget>[
                      Container(
                        height: 10.0,
                        width: 10.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          color: PINK,
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        '${_categoryList[0]}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0,
                        ),
                      )
                    ],
                  )
                : Container(),
          ],
        ),
      ),
    );
  }

  _buildChipsList() {
    List<Widget> chips = List();
    _serviceList.forEach((item) {
      chips.add(FilterChip(
        avatar: CircleAvatar(
          backgroundColor: Colors.grey.shade50,
        ),
        label: Text(item.name),
        checkmarkColor: Colors.white,
        labelStyle: TextStyle(
          color: Colors.white,
          fontSize: 12.5,
        ),
        selected: selectedChoices.contains(item),
        backgroundColor: PURPLE_DEEP,
        onSelected: (isSelected) {
          setState(() {
            selectedChoices.contains(item)
                ? selectedChoices.remove(item)
                : selectedChoices.add(item);
          });
        },
        selectedColor: PINK,
      ));
    });

    return chips;
  }
}
