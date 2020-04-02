import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vogu/models/specialist.dart';
import 'package:vogu/screens/payment/payment-options.dart';
import 'package:vogu/util/default_colors.dart';
import 'package:vogu/widgets/cross-icon.dart';

class SpecialistDetails extends StatefulWidget {
  final Specialist specialist;

  const SpecialistDetails({Key key, this.specialist}) : super(key: key);

  @override
  _SpecialistDetailsState createState() => _SpecialistDetailsState();
}

class _SpecialistDetailsState extends State<SpecialistDetails> {
  final double expanded_height = 350.0;
  final double rounded_container_height = 50.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          _buildSilverHead(),
          SliverToBoxAdapter(child: _buildDetail())
        ],
      ),
    );
  }

  Widget _buildSilverHead() {
    return SliverPersistentHeader(
      delegate: DetailSliverDelegate(
          expanded_height, widget.specialist, rounded_container_height),
    );
  }

  Widget _buildDetail() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 32.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            height: expanded_height - 100,
            decoration:
                BoxDecoration(border: Border.all(color: Colors.red, width: 1)),
          ),
          SizedBox(height: 20.0),
          RaisedButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
            color: PURPLE_DEEP,
            textColor: Colors.white,
            padding: EdgeInsets.symmetric(vertical: 15.0),
            child: Text(
              'Confirmar',
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => PaymentOptions(),
              ),
            ),
          ),
          SizedBox(height: 20.0)
        ],
      ),
    );
  }
}

class DetailSliverDelegate extends SliverPersistentHeaderDelegate {
  final double expendedHeight;
  final Specialist specialist;
  final roundedContainerHeight;

  DetailSliverDelegate(
      this.expendedHeight, this.specialist, this.roundedContainerHeight);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Stack(
      children: <Widget>[
        Hero(
          tag: specialist.imgUrl,
          child: Stack(
            children: <Widget>[
              Image.asset(
                specialist.imgUrl,
                width: MediaQuery.of(context).size.width,
                height: expendedHeight,
                fit: BoxFit.cover,
              ),
              CrossIcon(
                paddingRight: 20.0,
                paddingTop: 40.0,
              )
            ],
          ),
        ),
        Positioned(
          top: expendedHeight - roundedContainerHeight - shrinkOffset,
          left: 0.0,
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: roundedContainerHeight,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(30.0),
              ),
            ),
          ),
        ),
        Positioned(
          top: expendedHeight - 110 - shrinkOffset,
          left: 30.0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                specialist.name,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 30.0,
                    decoration: TextDecoration.none),
              ),
              Text(
                specialist.address,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 15.0,
                    decoration: TextDecoration.none),
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  double get maxExtent => expendedHeight;

  @override
  double get minExtent => 0.0;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
