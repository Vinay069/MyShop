// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
import '../Config/config.dart';
import '../Widgets/myDrawer.dart';
import '../main.dart';
import 'dart:core';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../Widgets/searchBox.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  var userid = EcommerceApp.sharedPreferences.getString(EcommerceApp.userUID);

  // var cartLister =
  //     EcommerceApp.sharedPreferences.getString(EcommerceApp.userCartList);
  // List<String> lister = [];
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("My Cart")),
      drawer: MyDrawer(),
      body: CustomScrollView(
        slivers: [
          SliverPersistentHeader(pinned: true, delegate: SearchBoxDelegate()),
          StreamBuilder<QuerySnapshot>(
            stream: Firestore.instance.collection("items").snapshots(),
            builder: (context, dataSnapshot) {
              return !dataSnapshot.hasData
                  ? SliverToBoxAdapter(
                child: Center(
                  child: circularProgress(),
                ),
              )
                  : SliverStaggeredGrid.countBuilder(
                crossAxisCount: 1,
                staggeredTileBuilder: (c) => StaggeredTile.fit(1),
                itemBuilder: (context, index) {
                  ItemModel model = ItemModel.fromJson(
                      dataSnapshot.data.documents[index].data);
                  if (checkItemInUserCart(model.productId, context)) {
                    return sourceInfo(model, context);
                  }
                  else {

                    return Divider(
                      // height: 10.0,
                      color: Colors.white,
                      // thickness: 6.0,
                    );
                  }
                },
                itemCount: dataSnapshot.data.documents.length,
              );
            },
          ),
        ],
      ),
    );
  }

  bool checkItemInUserCart(String productIdAsID, BuildContext context) {
    print("hi");
    print(productIdAsID);
    print(EcommerceApp.sharedPreferences
        .getStringList(EcommerceApp.userCartList));
    print(EcommerceApp.sharedPreferences
        .getStringList(EcommerceApp.userCartList)
        .contains(productIdAsID));
    return EcommerceApp.sharedPreferences
        .getStringList(EcommerceApp.userCartList)
        .contains(productIdAsID);
  }
}
