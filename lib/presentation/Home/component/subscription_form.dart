import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ojoregedapp/data/Data_Source/userFunctionality_data_source.dart';
import 'package:ojoregedapp/domain/entity/update_subscribe_entity.dart';
import 'package:ojoregedapp/domain/use_case/shared_login.dart';

class subscriptionform extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _subscriptionID = TextEditingController();

  subscriptionform({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: _subscriptionID,
                decoration: InputDecoration(labelText: 'subscription level'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the subscription level';
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
                    UpdateSubscribeEntity model = UpdateSubscribeEntity(
                      subscriptionId: int.tryParse(_subscriptionID.text),
                      customerId: token,
                    );
                    var address = await userFunctionalityDataSource.update_subscription(model);
                    Get.offNamed('/Home');
                  }
                },
                child: Text('Save Subscription'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
