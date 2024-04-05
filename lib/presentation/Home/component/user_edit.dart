import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ojoregedapp/data/Data_Source/userFunctionality_data_source.dart';
import 'package:ojoregedapp/domain/entity/update_user_entity.dart';
import 'package:ojoregedapp/domain/use_case/shared_login.dart';

import '../../../domain/entity/customer_profile_entity.dart';

class editUser extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _firstname = TextEditingController();
  final TextEditingController _middlename = TextEditingController();
  final TextEditingController _lastname = TextEditingController();
  final TextEditingController _telephone = TextEditingController();
  final TextEditingController _username = TextEditingController();
  final CustomerProfileEntity customerProfile;

  editUser({Key? key, required this.customerProfile}) : super(key: key) {
    _firstname.text = customerProfile.firstName;
    _middlename.text = customerProfile.middleName;
    _lastname.text = customerProfile.lastName;
    _telephone.text = customerProfile.telephone;
    _username.text = customerProfile.username;
  }

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        appBar: AppBar(
          title: Text("Edit Profile"),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                
                Stack(
                  children: [
                    SizedBox(
                      width: 120,
                      height: 120,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Icon(Icons.person_pin_rounded)),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        width: 35,
                        height: 35,
                        decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(100), color: const Color.fromRGBO(217, 237, 191, 1),),
                        child: const Icon(Icons.camera, color: Colors.black, size: 20),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 50),
                Form(
                  key: _formKey,
                  child: Column(
                    children :[
                      TextFormField(
                        controller: _username,
                        decoration: InputDecoration(
                          labelText: 'User Name',
                          prefixIcon: Icon(Icons.person_pin),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter username';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        controller: _firstname,
                        decoration: InputDecoration(
                          labelText: 'First Name',
                          prefixIcon: Icon(Icons.person_pin),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter first name';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        controller: _middlename,
                        decoration: InputDecoration(
                          labelText: 'Middle Name',
                          prefixIcon: Icon(Icons.person_pin),
                        ),
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        controller: _lastname,
                        decoration: InputDecoration(
                          labelText: 'Last Name',
                          prefixIcon: Icon(Icons.person_pin),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter last name';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        controller: _telephone,
                        decoration: InputDecoration(
                          labelText: 'Telephone',
                          prefixIcon: Icon(Icons.phone),
                        ),
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              int? token = await sharedLogin.getTokenID();
                              UpdateUserEntity model = UpdateUserEntity(
                                firstName: _firstname.text,
                                middleName: _middlename.text,
                                lastName: _lastname.text,
                                telephone: _telephone.text,
                                username: _username.text,
                                customerId: token,
                              );
                              var address = await userFunctionalityDataSource.update_profile(model);
                              Get.offNamed('/Home');
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            side: BorderSide.none,
                            shape: const StadiumBorder(),
                          ),
                          child: const Text(
                            "Edit Profile",
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
  }
}
