// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'dart:html';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:my_shop/Config/config.dart';
import 'package:my_shop/Store/addressPage.dart';
import 'package:my_shop/Store/product_page.dart';
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
import 'package:my_shop/Widgets/pricebox.dart';

class CartPage extends StatefulWidget {
  
  
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  // var userid = EcommerceApp.sharedPreferences.getString(EcommerceApp.userUID);

  // var cartLister =
  //     EcommerceApp.sharedPreferences.getString(EcommerceApp.userCartList);
  // List<String> lister = [];
  int totalPrice = 0;
  // getTotalPrice();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
          "My Cart",
          style: TextStyle(
              fontSize: 55.0, color: Colors.white, fontFamily: "Signatra"),
        ),
        // centerTitle: true,
        actions: [
          Stack(
            children: [
              // TextButton(
              //   child: Text("Checkout",
              //   style: TextStyle(fontSize: 19),),

              //   onPressed: () {
              //     // Route route = MaterialPageRoute(builder: (c) => CartPage());
              //     // Navigator.pushReplacement(context, route);
              //     Navigator.push(context,
              //         MaterialPageRoute(builder: (context) => CartPage()));
              //   },
              // ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: RaisedButton(
                  onPressed: () {
                     Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AddressScreen()));

                  },
                  child: Text("Proceed"),
                ),
              )
            ],
          ),
        ],
      ),
      drawer: MyDrawer(),
      body: CustomScrollView(
        slivers: [
          SliverPersistentHeader(
              pinned: true, delegate: PriceBoxDelegate(totalPrice)),
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
                          totalPrice = model.price + totalPrice;
                          return sourceInfoo(model, context);
                        } else {
                          return SizedBox();
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
    // print("hi");
    print(totalPrice);
    // var li =
    //     EcommerceApp.sharedPreferences.getStringList(EcommerceApp.userCartList);
    // print(li);
    // print(productIdAsID);
    print(EcommerceApp.sharedPreferences
        .getStringList(EcommerceApp.userCartList));
    // print(EcommerceApp.sharedPreferences
    //     .getStringList(EcommerceApp.userCartList)
    //     .contains(productIdAsID));
    return EcommerceApp.sharedPreferences
        .getStringList(EcommerceApp.userCartList)
        .contains(productIdAsID);
  }

  // int getTotalPrice() {
  //   Firestore.instance
  //       .collection('items')
  //       .getDocuments()
  //       .then((QuerySnapshot querySnapshot) {
  //     querySnapshot.documents.forEach((doc) {
  //       // print(doc["price"]);
  //     });
  //   });
  //   return totalPrice;
  // }
}

Widget sourceInfoo(ItemModel model, BuildContext context,
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
                                  r"Original Price: ₹ ",
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
                                  "₹ ",
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
