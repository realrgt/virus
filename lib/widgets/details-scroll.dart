import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vogu/core/models/task.dart';
import 'package:vogu/models/categories-services.dart';
import 'package:vogu/util/default_colors.dart';
import 'package:vogu/util/img_assets.dart';
import 'package:vogu/widgets/custom-expansiontile.dart';

class DetailsScroll extends StatefulWidget {
  @override
  _DetailsScrollState createState() => _DetailsScrollState();
}

class _DetailsScrollState extends State<DetailsScroll> {
  // List of categoryImages
  Set<String> _imgUrls;

  int _selectedIndex = 0;

  // Related to choiceChips
  List<Service> _servicesFromProvider;
  List<Service> _serviceList;
  Set<String> _categorySet;
  @override
  void initState() {
    _categorySet = Set();
    _imgUrls = Set();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    /// [task] provider
    var taskProvider = Provider.of<Task>(context);

    _servicesFromProvider = taskProvider.services.toList();

    _servicesFromProvider.forEach((s) {
      _categorySet.add(s.category);
    });

    _categorySet.forEach((c) {
      switch (c) {
        case 'Unhas':
          _imgUrls.add(NEILS);
          break;
        case 'Rosto':
          _imgUrls.add(FACE);
          break;
        case 'Makeup':
          _imgUrls.add(MAKEUP);
          break;
        case 'Massagem':
          _imgUrls.add(MASSAGE);
          break;
        case 'Depilação':
          _imgUrls.add(HAIR_REMOVAL);
          break;
        case 'Cabelos':
          _imgUrls.add(HAIR);
          break;
      }
    });

    return Column(
      children: <Widget>[
        Container(
          height: 95.0,
          width: double.infinity,
          child: ListView(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: 32.0),
            shrinkWrap: true,
            children: _imgUrls.toList().asMap().entries.map(
              (MapEntry map) {
                return _buildCircleImg(map.key);
              },
            ).toList(),
          ),
        ),
        SizedBox(height: 5.0),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 32.0),
          height: 200,
          width: MediaQuery.of(context).size.width,
          child: SingleChildScrollView(
            child: Column(
              children: _categorySet
                  .toList()
                  .asMap()
                  .entries
                  .map((MapEntry map) => _buildTiles(map.key))
                  .toList(),
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
                  height: 80.0,
                  width: 80.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: _selectedIndex == index ? PINK : PURPLE_DEEP,
                  ),
                ),
                Positioned(
                  top: 5,
                  left: 5,
                  child: Container(
                    height: 70.0,
                    width: 70.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(37.5),
                      image: DecorationImage(
                        image: AssetImage(_imgUrls.elementAt(index)),
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
                      color: PINK,
                    ),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }

  Widget _buildTiles(int index) {
    _serviceList = _servicesFromProvider
        .where(
          (s) => s.category == _categorySet.elementAt(index),
        )
        .toList();

    return Container(
      child: CustomExpansionTile(
        animatedWidgetFollowingHeader: Icon(
          Icons.expand_more,
          // color: Color(0xFF707070),
          color: PURPLE_DEEP,
        ),
        header: Text(
          _categorySet.elementAt(index),
          style: TextStyle(
            color: Colors.black.withOpacity(0.7),
            fontSize: 20.0,
            fontWeight: FontWeight.w400,
          ),
        ),
        children: _serviceList
            .asMap()
            .entries
            .map((MapEntry map) => _buildServiceItems(map.key))
            .toList(),
      ),
    );
  }

  Widget _buildServiceItems(index) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 3.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                width: 5,
                height: 5,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: PURPLE_DEEP,
                ),
              ),
              SizedBox(width: 10.0),
              Text(
                _serviceList[index].name,
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          Text(
            '${_serviceList[index].price} MT',
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
