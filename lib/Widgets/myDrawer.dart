import 'package:my_shop/Authentication/authenication.dart';
import 'package:my_shop/Config/config.dart';

import 'package:my_shop/Store/Search.dart';
import 'package:my_shop/Store/cart.dart';
import 'package:my_shop/Orders/myOrders.dart';
import 'package:my_shop/Store/addressPage.dart';
import 'package:my_shop/Store/storehome.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../Authentication/authenication.dart';
import '../Config/config.dart';
import '../Config/config.dart';
import '../Orders/myOrders.dart';
import '../Store/Search.dart';
import '../Store/cart.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          Container(
            padding: EdgeInsets.only(top: 25.0, bottom: 10.0),
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
            child: Column(
              children: [
                Material(
                  borderRadius: BorderRadius.all(Radius.circular(80.0)),
                  elevation: 8.0,
                  child: Container(
                    height: 160.0,
                    width: 160.0,
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(
                        EcommerceApp.sharedPreferences
                            .getString(EcommerceApp.userAvatarUrl),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  EcommerceApp.sharedPreferences
                      .getString(EcommerceApp.userName),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 35.0,
                      fontFamily: "Signatra"),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 5.0,
          ),
          Container(
            padding: EdgeInsets.only(top: 1.0),
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
            child: Column(
              children: [
                ListTile(
                  leading: Icon(
                    Icons.home,
                    color: Colors.white,
                  ),
                  title: Text(
                    "Home",
                    style: TextStyle(color: Colors.white),
                  ),
                  onTap: () {
                    // Route route =
                    //     MaterialPageRoute(builder: (c) => StoreHome());
                    // Navigator.pushReplacement(context, route);
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => StoreHome()));
                  },
                ),
                Divider(
                  // height: 10.0,
                  color: Colors.white,
                  // thickness: 6.0,
                ),
                // ListTile(
                //   leading: Icon(
                //     Icons.person,
                //     color: Colors.white,
                //   ),
                //   title: Text(
                //     "My Address",
                //     style: TextStyle(color: Colors.white),
                //   ),
                //   onTap: () {
                //     // Route route =
                //     //     MaterialPageRoute(builder: (c) => AddressScreen());
                //     // Navigator.pushReplacement(context, route);
                //     Navigator.push(
                //         context,
                //         MaterialPageRoute(
                //             builder: (context) => AddressScreen()));
                //   },
                // ),
                // Divider(
                //   // height: 10.0,
                //   color: Colors.white,
                //   // thickness: 6.0,
                // ),
                ListTile(
                  leading: Icon(
                    Icons.reorder,
                    color: Colors.white,
                  ),
                  title: Text(
                    "My Orders",
                    style: TextStyle(color: Colors.white),
                  ),
                  onTap: () {
                    // Route route = MaterialPageRoute(builder: (c) => MyOrders());
                    // Navigator.pushReplacement(context, route);
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => MyOrders()));
                  },
                ),
                Divider(
                  // height: 10.0,
                  color: Colors.white,
                  // thickness: 6.0,
                ),
                ListTile(
                  leading: Icon(
                    Icons.shopping_cart,
                    color: Colors.white,
                  ),
                  title: Text(
                    "My Cart",
                    style: TextStyle(color: Colors.white),
                  ),
                  onTap: () {
                    // Route route = MaterialPageRoute(builder: (c) => CartPage());
                    // Navigator.pushReplacement(context, route);
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => CartPage()));
                  },
                ),
                Divider(
                  // height: 10.0,
                  color: Colors.white,
                  // thickness: 6.0,
                ),
                // ListTile(
                //   leading: Icon(
                //     Icons.search,
                //     color: Colors.white,
                //   ),
                //   title: Text(
                //     "Search",
                //     style: TextStyle(color: Colors.white),
                //   ),
                //   onTap: () {
                //     Route route =
                //         MaterialPageRoute(builder: (c) => SearchProduct());
                //     Navigator.pushReplacement(context, route);
                //   },
                // ),
                // Divider(
                //   // height: 10.0,
                //   color: Colors.white,
                //   // thickness: 6.0,
                // ),

                ListTile(
                  leading: Icon(
                    Icons.exit_to_app,
                    color: Colors.white,
                  ),
                  title: Text(
                    "Logout",
                    style: TextStyle(color: Colors.white),
                  ),
                  onTap: () {
                    EcommerceApp.auth.signOut().then((c) {
                      Route route =
                          MaterialPageRoute(builder: (c) => AuthenticScreen());
                      Navigator.pushReplacement(context, route);
                    });
                  },
                ),
                Divider(
                  // height: 10.0,
                  color: Colors.white,
                  // thickness: 6.0,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
