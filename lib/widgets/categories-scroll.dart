import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vogu/core/models/service.dart';
import 'package:vogu/core/models/task.dart';
import 'package:vogu/models/categories-services.dart';
import 'package:vogu/util/default_colors.dart';

class CategoriesScroll extends StatefulWidget {
  @override
  _CategoriesScrollState createState() => _CategoriesScrollState();
}

class _CategoriesScrollState extends State<CategoriesScroll> {
  // List of categoryImages
  List<String> _imgUrls = categories.map((c) => c.imgUrl).toList();

  int _selectedIndex = 0;

  // Related to choiceChips
  List<Service> _serviceList;
  List<String> _categoryList;
  List<Service> selectedChoices = List();

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

    return Column(
      children: <Widget>[
        Container(
          height: 140.0,
          width: double.infinity,
          color: Colors.white,
          child: ListView(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: 10.0),
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
          color: Colors.white,
          width: MediaQuery.of(context).size.width,
          child: SingleChildScrollView(
            child: Wrap(
              alignment: WrapAlignment.spaceEvenly,
              spacing: 2.0,
              runSpacing: 0.0,
              children: _buildChipsList(context),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCircleImg(int index) {
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

  _buildChipsList(BuildContext ctx) {
    // TODO: watch this======================
    final serviceProvider = Provider.of<Servico>(context);

    if (selectedChoices.length > 0) {
      serviceProvider.services = selectedChoices;
      serviceProvider.services.forEach(print);
    }

    ///try provider
    var taskInfo = Provider.of<Task>(context);
    ///end try provider

    List<Widget> chips = List();
    _serviceList.forEach((item) {
      if (!selectedChoices.contains(item.name)) {
        chips.add(
          FilterChip(
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
                if (selectedChoices.contains(item)) {
                  selectedChoices.remove(item);
                  taskInfo.setServices(selectedChoices);
                } else {
                  selectedChoices.add(item);
                  taskInfo.setServices(selectedChoices);
                }
              });
            },
            selectedColor: PINK,
          ),
        );
      }
    });

    return chips;
  }
}
