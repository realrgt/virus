import 'dart:math';

import 'package:flutter/material.dart';
import 'package:vogu/models/categories-services.dart';
import 'package:vogu/screens/specialists/service-schedule.dart';

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
  List<Service> _list;
  List<Service> selectedChoices = List();
  int _currentCat = 1;

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

    _list = categories.where((c) => c.id == _currentCat).expand((c) => c.services).toList();

    return Column(
      children: <Widget>[
        Container(
          height: 100.0,
          width: double.infinity,
          child: ListView(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.only(left: 50.0),
            children: _imgUrls
                .asMap()
                .entries
                .map(
                  (MapEntry map) {
                    return _buildCircleImg(map.key);
                  },
                )
                .toList(),
          ),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Container(
            height: 200,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.red, width: 1)
            ),
            child: SingleChildScrollView(
              child: Wrap(
                spacing: 5.0,
                runSpacing: 2.0,
                children: _buildChipsList(),
              ),
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
          _currentCat = index + 1;
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
                    color: _selectedIndex == index
                        ? Colors.purple
                        : Colors.deepPurple,
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
                ? Container(
                    height: 10.0,
                    width: 10.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      color: Colors.purple,
                    ),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }

  //TODO//////////////////////////////////////

  _buildChipsList() {
    List<Widget> chips = List();

    _list.forEach((item) {
      chips.add(Container(
        padding: EdgeInsets.all(2.0),
        child: FilterChip(
          avatar: CircleAvatar(
            backgroundColor: Colors.grey.shade50,
          ),
          label: Text(item.name),
          checkmarkColor: Color(0xff6200ee),
          labelStyle: TextStyle(
            color: Color(0xff6200ee),
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
          ),
          selected: selectedChoices.contains(item),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
          backgroundColor: Color(0xffededed),
          onSelected: (isSelected) {
            setState(() {
              selectedChoices.contains(item)
                  ? selectedChoices.remove(item)
                  : selectedChoices.add(item);
            });
          },
          selectedColor: Color(0xffeadffd),
        ),
      ));
    });

    return chips;
  }

}
