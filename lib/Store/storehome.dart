import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_shop/Store/cart.dart';
import 'package:my_shop/Store/product_page.dart';
import 'package:my_shop/Counters/cartitemcounter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:my_shop/Config/config.dart';
import '../Config/config.dart';
import '../Counters/cartitemcounter.dart';
import '../Models/item.dart';
import '../Widgets/loadingWidget.dart';
import '../Widgets/myDrawer.dart';
import '../Widgets/searchBox.dart';
import 'cart.dart';
import 'product_page.dart';

double width;

class StoreHome extends StatefulWidget {
  @override
  _StoreHomeState createState() => _StoreHomeState();
}

class _StoreHomeState extends State<StoreHome> {
  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
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
        ),
        title: Text(
          "My Shop",
          style: TextStyle(
              fontSize: 55.0, color: Colors.white, fontFamily: "Signatra"),
        ),
        centerTitle: true,
        actions: [
          Stack(
            children: [
              IconButton(
                icon: Icon(
                  Icons.shopping_cart,
                  color: Colors.white,
                ),
                onPressed: () {
                  // Route route = MaterialPageRoute(builder: (c) => CartPage());
                  // Navigator.pushReplacement(context, route);
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => CartPage()));
                },
              ),
              Positioned(
                  child: Stack(
                children: [
                  Icon(
                    Icons.brightness_1,
                    size: 20.0,
                    color: Colors.green,
                  ),
                  Positioned(
                    top: 3.0,
                    bottom: 4.0,
                    left: 6.5,
                    child: Consumer<CartItemCounter>(
                      builder: (context, counter, _) {
                        return Text(
                          counter.count.toString(),
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 12.0,
                              fontWeight: FontWeight.w500),
                        );
                      },
                    ),
                  ),
                ],
              ))
            ],
          ),
        ],
      ),
      drawer: MyDrawer(),
      body: CustomScrollView(
        slivers: [
          SliverPersistentHeader(pinned: true, delegate: SearchBoxDelegate()),
          StreamBuilder<QuerySnapshot>(
            stream: Firestore.instance
                .collection("items")
                .limit(15)
                .orderBy("publishedDate", descending: true)
                .snapshots(),
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

                        return sourceInfo(model, context);
                      },
                      itemCount: dataSnapshot.data.documents.length,
                    );
            },
          ),
        ],
      ),
    );
  }
}

Widget sourceInfo(ItemModel model, BuildContext context,
    {Color background, removeCartFunction}) {
  return InkWell(
    onTap: () {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ProductPage(itemModel: model)));
      // Route route =
      //     MaterialPageRoute(builder: (c) => ProductPage(itemModel: model));
      // Navigator.pushReplacement(context, route);
    },
    splashColor: Colors.pink,
    child: Padding(
      padding: EdgeInsets.all(6.0),
      child: Container(
        height: 190.0,
        width: width,
        child: Row(
          children: [
            Image.network(
              model.thumbnailUrl,
              width: 140.0,
              height: 140.0,
            ),
            SizedBox(
              width: 4.0,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 15.0,
                  ),
                  Container(
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Text(
                            model.title,
                            style:
                                TextStyle(color: Colors.black, fontSize: 14.0),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Container(
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Text(
                            model.shortInfo,
                            style: TextStyle(
                                color: Colors.black54, fontSize: 12.0),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          color: Colors.pink,
                        ),
                        alignment: Alignment.topLeft,
                        width: 40.0,
                        height: 43.0,
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "50%",
                                style: TextStyle(
                                    fontSize: 15.0,
                                    color: Colors.white,
                                    fontWeight: FontWeight.normal),
                              ),
                              Text(
                                "OFF",
                                style: TextStyle(
                                    fontSize: 12.0,
                                    color: Colors.white,
                                    fontWeight: FontWeight.normal),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 0.0),
                            child: Row(
                              children: [
                                Text(
                                  r"Original Price: ??? ",
                                  style: TextStyle(
                                    fontSize: 14.0,
                                    color: Colors.grey,
                                    // decoration: TextDecoration.lineThrough,
                                  ),
                                ),
                                Text(
                                  (model.price + model.price).toString(),
                                  style: TextStyle(
                                    fontSize: 15.0,
                                    color: Colors.grey,
                                    decoration: TextDecoration.lineThrough,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 5.0),
                            child: Row(
                              children: [
                                Text(
                                  r"New Price: ",
                                  style: TextStyle(
                                    fontSize: 14.0,
                                    color: Colors.grey,
                                  ),
                                ),
                                Text(
                                  "??? ",
                                ),
                                Text(
                                  (model.price).toString(),
                                  style: TextStyle(
                                    fontSize: 15.0,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  Flexible(
                    child: Container(),
                  ),

                  //to implement the cart item features
                  Align(
                    alignment: Alignment.centerRight,
                    child: removeCartFunction == null
                        ? IconButton(
                            icon: Icon(
                              Icons.add_shopping_cart,
                              color: Colors.pinkAccent,
                            ),
                            onPressed: () {
                              checkItemInCart(model.productId, context);
                            },
                          )
                        : IconButton(
                            icon: Icon(
                              Icons.delete,
                              color: Colors.pinkAccent,
                            ),
                          ),
                  ),
                  Divider(
                    height: 10.0,
                    color: Colors.green,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

Widget card({Color primaryColor = Colors.redAccent, String imgPath}) {
  return Container();
}

void checkItemInCart(String productIdAsID, BuildContext context) {
  EcommerceApp.sharedPreferences
          .getStringList(EcommerceApp.userCartList)
          .contains(productIdAsID)
      ? Fluttertoast.showToast(msg: "Item is already in Cart.")
      : addItemToCart(productIdAsID, context);
}

addItemToCart(String productIdAsID, BuildContext context) {
  var usercartlist =
      EcommerceApp.sharedPreferences.getStringList(EcommerceApp.userCartList);
  print(usercartlist);

  List tempCartList =
      EcommerceApp.sharedPreferences.getStringList(EcommerceApp.userCartList);
  tempCartList.add(productIdAsID);

  EcommerceApp.firestore
      .collection(EcommerceApp.collectionUser)
      .document(EcommerceApp.sharedPreferences.getString(EcommerceApp.userUID))
      .updateData({
    EcommerceApp.userCartList: tempCartList,
  }).then((v) {
    Fluttertoast.showToast(msg: "Item added to Cart Successfully.");

    EcommerceApp.sharedPreferences
        .setStringList(EcommerceApp.userCartList, tempCartList);

    Provider.of<CartItemCounter>(context, listen: false).displayResult();
  });
}
