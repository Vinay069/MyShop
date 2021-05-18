import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../Widgets/myDrawer.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
        backgroundColor: Colors.pinkAccent,
        title: Text("Profile" ,style: TextStyle(fontFamily: "Signatra", fontSize: 40.0),),
        centerTitle: true,
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _formKey.currentState.validate();
        },
        child: Icon(Icons.done),
      ),
    );
  }
  // Future saveUserInfoToFireStore(FirebaseUser fUser) async {
  //   Firestore.instance.collection("users").document(fUser.uid).setData({
  //     "uid": fUser.uid,
  //     "email": fUser.email,
  //     "name": _nameTextEditingController.text.trim(),
  //     "url": userImageUrl,
  //     EcommerceApp.userCartList: ["garbageValue"]
  //   });

  //   await EcommerceApp.sharedPreferences.setString("uid", fUser.uid);
  //   await EcommerceApp.sharedPreferences
  //       .setString(EcommerceApp.userEmail, fUser.email);
  //   await EcommerceApp.sharedPreferences
  //       .setString(EcommerceApp.userName, _nameTextEditingController.text);
  //   await EcommerceApp.sharedPreferences
  //       .setString(EcommerceApp.userAvatarUrl, userImageUrl);
  //   await EcommerceApp.sharedPreferences
  //       .setStringList(EcommerceApp.userCartList, ["garbageValue"]);
  // }
}
