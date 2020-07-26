import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttermessage/object_transfer/userInfo.dart';
import 'package:fluttermessage/view/home_screen.dart';

class PhoneNumberScreen extends StatelessWidget {
  final _phoneController = TextEditingController();
  final _codeController = TextEditingController();
  User_Info user_info;
  PhoneNumberScreen(this.user_info);

  final firestoreInstance = Firestore.instance;

  void updatePhoneIfNotExist(String phone) async {
    firestoreInstance.collection("users").document(user_info.gmail).updateData(
        {"phone":"$phone",
        }).then((_){print("success add phone!");});
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(32),
            child: Form(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Regist Phone Number", style: TextStyle(color: Colors.lightBlue, fontSize: 36, fontWeight: FontWeight.w500),),

                  SizedBox(height: 16,),

                  TextFormField(
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            borderSide: BorderSide(color: Colors.grey[200])
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            borderSide: BorderSide(color: Colors.grey[300])
                        ),
                        filled: true,
                        fillColor: Colors.grey[100],
                        hintText: "Mobile Number"
                    ),
                    controller: _phoneController,
                  ),

                  SizedBox(height: 16,),


                  Container(
                    width: double.infinity,
                    child: RaisedButton(
                      child: Text("Regist"),
                      textColor: Colors.white,
                      padding: EdgeInsets.all(16),
                      onPressed: () {
                        updatePhoneIfNotExist(_phoneController.text.trim());
                        Navigator.pop(context,_phoneController.text.trim());
                      },
                      color: Colors.blue,
                    ),
                  )
                ],
              ),
            ),
          ),
        )
    );
  }
}
