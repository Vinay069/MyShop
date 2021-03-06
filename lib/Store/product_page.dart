import 'package:my_shop/Widgets/customAppBar.dart';
import 'package:my_shop/Widgets/myDrawer.dart';
import 'package:my_shop/Models/item.dart';
import 'package:flutter/material.dart';
import 'package:my_shop/Store/storehome.dart';

import '../Models/item.dart';
import '../Widgets/customAppBar.dart';
import '../Widgets/myDrawer.dart';
import 'storehome.dart';

class ProductPage extends StatefulWidget {
  final ItemModel itemModel;
  ProductPage({this.itemModel});
  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  int quantityOfItems = 1;
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: MyAppBar(),
      drawer: MyDrawer(),
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.all(15.0),
            width: MediaQuery.of(context).size.width,
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Center(
                      child: Image.network(widget.itemModel.thumbnailUrl),
                    ),
                    Container(
                      color: Colors.grey[300],
                      child: SizedBox(
                        height: 1.0,
                        width: double.infinity,
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: EdgeInsets.all(20.0),
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.itemModel.title,
                          style: boldTextStyle,
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          widget.itemModel.longDescription,
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          "??? " + widget.itemModel.price.toString(),
                          style: boldTextStyle,
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 8.0),
                  child: Center(
                    child: InkWell(
                      onTap: () => checkItemInCart(widget.itemModel.productId,context),
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
                        width: MediaQuery.of(context).size.width - 40.0,
                        height: 50.0,
                        child: Center(
                          child: Text(
                            "Add to Cart",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 8.0),
                  child: Center(
                    child: InkWell(
                      onTap: () =>
                          buyNowToAddress(widget.itemModel.productId),
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
                        width: MediaQuery.of(context).size.width - 40.0,
                        height: 50.0,
                        child: Center(
                          child: Text(
                            "Buy Now",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  buyNowToAddress(String productId) {
    print('Buy Now'+productId);
  }
}

const boldTextStyle = TextStyle(fontWeight: FontWeight.bold, fontSize: 20);
const largeTextStyle = TextStyle(fontWeight: FontWeight.normal, fontSize: 20);
