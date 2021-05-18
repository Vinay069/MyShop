import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_shop/Store/addressPage.dart';

import '../Store/Search.dart';
import '../Store/Search.dart';

class PriceBoxDelegate extends SliverPersistentHeaderDelegate {
  int totalPrice = 0;

  PriceBoxDelegate(int price) {
    totalPrice = price;
  }
  @override
  Widget build(
          BuildContext context, double shrinkOffset, bool overlapsContent) =>
      InkWell(
        onTap: () {
          // Route route = MaterialPageRoute(builder: (c) => AddressScreen());
          // Navigator.pushReplacement(context, route);
          MaterialPageRoute(
              builder: (context) => AddressScreen());
        },
        child: Container(
          decoration: new BoxDecoration(
            gradient: new LinearGradient(
              colors: [Colors.pink, Colors.purple],
              begin: const FractionalOffset(0.0, 0.0),
              end: const FractionalOffset(1.0, 1.0),
              stops: [0.0, 1.0],
              tileMode: TileMode.clamp,
            ),
            // color: Colors.deepOrange,
          ),
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width,
          height: 80.0,
          child: InkWell(
            child: Container(
              margin: EdgeInsets.only(left: 10.0, right: 10.0),
              width: MediaQuery.of(context).size.width,
              height: 50.0,
              decoration: BoxDecoration(
                color: Colors.white,
                // borderRadius: BorderRadius.circular(60.0),
              ),
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Text("Proceed to pay "),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 8.0),
                    child: Text(totalPrice.toString(),)
                  ),
                ],
              ),
            ),
          ),
        ),
      );

  @override
  double get maxExtent => 80;

  @override
  double get minExtent => 80;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => true;
}
