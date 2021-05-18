import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_shop/Config/config.dart';

import '../Widgets/myDrawer.dart';

class AddressScreen extends StatefulWidget {
  @override
  _AddressScreenState createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  var userid = EcommerceApp.sharedPreferences.getString(EcommerceApp.userUID);

  final _aNameTextEditingController = TextEditingController();
  final _aMobileTextEditingController = TextEditingController();
  final _aAddressTextEditingController = TextEditingController();
  final _aCityTextEditingController = TextEditingController();
  final _aStateTextEditingController = TextEditingController();
  final _aPincodeTextEditingController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pinkAccent,
        title: Text(
          "My Address",
          style: TextStyle(fontFamily: "Signatra", fontSize: 40.0),
        ),
        actions: [
          Stack(
            children: [
              
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: RaisedButton(
                  onPressed: () {
                     Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AddressScreen()));

                  },
                  child: Text("Order Now"),
                ),
              )
            ],
          ),
        ],
      ),
      drawer: MyDrawer(),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          vertical: 20.0,
          horizontal: 10.0,
        ),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _aNameTextEditingController,
                validator: (String value) {
                  if (value.isEmpty) {
                    return 'Name cannot be empty';
                  } else if (value.length < 3) {
                    return 'Name must be at least 3 characters long';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelText: 'Full Name',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                ),
              ),
              SizedBox(height: 10.0),
              TextFormField(
                controller: _aMobileTextEditingController,
                keyboardType: TextInputType.number,
                validator: (String value) {
                  if (value.isEmpty) {
                    return 'Mobile no. cannot be empty';
                  } else if (value.length < 3) {
                    return 'Mobile no. must be at least 10 characters long';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelText: 'Mobile number',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                ),
              ),
              SizedBox(height: 10.0),
              TextFormField(
                controller: _aAddressTextEditingController,
                validator: (String value) {
                  if (value.isEmpty) {
                    return 'Address cannot be empty';
                  } else if (value.length < 3) {
                    return 'Address must be at least 10 characters long';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelText: 'Address',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                ),
              ),
              SizedBox(height: 10.0),
              TextFormField(
                controller: _aCityTextEditingController,
                validator: (String value) {
                  if (value.isEmpty) {
                    return 'City cannot be empty';
                  } else if (value.length < 3) {
                    return 'City must be at least 3 characters long';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelText: 'City',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                ),
              ),
              SizedBox(height: 10.0),
              TextFormField(
                controller: _aStateTextEditingController,
                validator: (String value) {
                  if (value.isEmpty) {
                    return 'State cannot be empty';
                  } else if (value.length < 3) {
                    return 'State must be at least 10 characters long';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelText: 'State',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                ),
              ),
              SizedBox(height: 10.0),
              TextFormField(
                controller: _aPincodeTextEditingController,
                keyboardType: TextInputType.number,
                validator: (String value) {
                  if (value.isEmpty) {
                    return 'Pincode cannot be empty';
                  } else if (value.length < 3) {
                    return 'Pincode must be at least 6 characters long';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelText: 'Pincode',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                ),
              ),
              SizedBox(height: 10.0),
            ],
          ),
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     //
      //     saveUserInfoToFireStore(userid);
      //   },
      //   child: Text("Order Now"),
        
      // ),
      
      
    );
  }

  Future saveUserInfoToFireStore(String uid) async {
    print(uid);
    print('update address presses');
    // Firestore.instance.collection("users").document(uid).collection('address').document().setData({
    //   // "aName": _aNameTextEditingController.text.trim(),
    //   // "aMobile": _aMobileTextEditingController.text.trim(),
    //   // "aAddress": _aAddressTextEditingController.text.trim(),
    //   // "aCity": _aCityTextEditingController.text.trim(),

    //   // "aState": _aStateTextEditingController.text.trim(),
    //   "aPincode": _aPincodeTextEditingController.text.trim(),

    // });
    // Firestore.instance.collection("users").document(uid)
    //     .collection('address')
    //     .document()
    //     .updateData({'aPincode': _aPincodeTextEditingController.text.trim()});

    // await EcommerceApp.sharedPreferences.setString("uid", fUser.uid);
    // await EcommerceApp.sharedPreferences
    //     .setString(EcommerceApp.userEmail, fUser.email);
    // await EcommerceApp.sharedPreferences
    //     .setString(EcommerceApp.userName, _nameTextEditingController.text);
    // await EcommerceApp.sharedPreferences
    //     .setString(EcommerceApp.userAvatarUrl, userImageUrl);
    // await EcommerceApp.sharedPreferences
    //     .setStringList(EcommerceApp.userCartList, ["garbageValue"]);
  }
}
