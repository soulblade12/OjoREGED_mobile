import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ojoregedapp/data/Data_Source/userFunctionality_data_source.dart';
import 'package:ojoregedapp/domain/use_case/shared_login.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../domain/entity/address_user_entity.dart';

class AddressInsertPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _provinceController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _streetAddressController = TextEditingController();
  final TextEditingController _postalCodeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Insert Address'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: _provinceController,
                decoration: InputDecoration(labelText: 'Province'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the province';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _cityController,
                decoration: InputDecoration(labelText: 'City'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the city';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _streetAddressController,
                decoration: InputDecoration(labelText: 'Street Address'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the street address';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _postalCodeController,
                decoration: InputDecoration(labelText: 'Postal Code'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the postal code';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    int? token = await sharedLogin.getTokenID();
                    // Form is valid, you can save the address here
                    AddressEntity model = AddressEntity(
                      city: _cityController.text,
                      postalCode: _postalCodeController.text,
                      province: _provinceController.text,
                      streetAddress: _streetAddressController.text,
                      customerId: token,
                    );
                    var address = await userFunctionalityDataSource.register_address(model);
                    Get.offNamed('/Home');
                  }
                },
                child: Text('Save Address'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
