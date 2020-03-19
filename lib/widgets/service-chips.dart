import 'package:flutter/material.dart';
import 'package:vogu/models/categories-services.dart';

class ServiceChips extends StatefulWidget {
  @override
  _ServiceChipsState createState() => _ServiceChipsState();
}

class _ServiceChipsState extends State<ServiceChips> {
  List<Service> _list = neilsList;
  bool _selected = false;
//  String selectedChoice = "";
  List<Service> selectedChoices = List();

  _buildChipsList() {
    List<Widget> chips = List();

    _list.forEach((item) {
      chips.add(Container(
        padding: EdgeInsets.all(2.0),
        child: FilterChip(
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

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        child: Wrap(
          spacing: 5.0,
          runSpacing: 2.0,
          children: _buildChipsList(),
        ),
      ),
    );
  }
}
