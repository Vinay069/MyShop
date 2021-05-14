import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:my_shop/Config/config.dart';
import 'package:my_shop/Address/address.dart';
import 'package:my_shop/Widgets/loadingWidget.dart';
import 'package:my_shop/Models/item.dart';
import 'package:my_shop/Counters/cartitemcounter.dart';
import 'package:my_shop/Counters/totalMoney.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:my_shop/Store/storehome.dart';
import 'package:provider/provider.dart';
import '../main.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: [
            Row(
              children: [
                Text(
                  "Your Cart",
                  style: TextStyle(color: Colors.white),
                ),
                Container(
                  
                  child: Padding(
                    padding: const EdgeInsets.only(left: 60),
                    child: Text(
                      "4 items",
                      style: TextStyle(color: Colors.white, ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
      
    );

    // return Scaffold(
    //   appBar: AppBar(
    //       flexibleSpace: Container(
    //         decoration: new BoxDecoration(
    //           gradient: new LinearGradient(
    //             colors: [Colors.pink, Colors.purple],
    //             begin: const FractionalOffset(0.0, 0.0),
    //             end: const FractionalOffset(1.0, 1.0),
    //             stops: [0.0, 1.0],
    //             tileMode: TileMode.clamp,
    //           ),
    //           // color: Colors.deepOrange,
    //         ),
    //       ),
    //       title: Text(
    //         "My Cart",
    //         style: TextStyle(fontSize: 55.0, color: Colors.white,fontFamily: "Signatra"),
    //       ),
    //       centerTitle: true,

    //     ),

    //     body:  CustomScrollView(
    //       slivers: [
    //         // SliverPersistentHeader(pinned: true, delegate: SearchBoxDelegate()),
    //         StreamBuilder<QuerySnapshot>(
    //           stream: Firestore.instance
    //               .collection("items")
    //               .limit(15)
    //               .orderBy("publishedDate", descending: true)
    //               .snapshots(),
    //           builder: (context, dataSnapshot) {
    //             return !dataSnapshot.hasData
    //                 ? SliverToBoxAdapter(
    //                     child: Center(
    //                       child: circularProgress(),
    //                     ),
    //                   )
    //                 : SliverStaggeredGrid.countBuilder(
    //                     crossAxisCount: 1,
    //                     staggeredTileBuilder: (c) => StaggeredTile.fit(1),
    //                     itemBuilder: (context, index) {
    //                       ItemModel model = ItemModel.fromJson(
    //                           dataSnapshot.data.documents[index].data);
    //                       return sourceInfo(model, context);
    //                     },
    //                     itemCount: dataSnapshot.data.documents.length,
    //                   );
    //           },
    //         ),
    //       ],
    //     ),

    // );
  }
}
