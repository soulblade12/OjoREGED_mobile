import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ojoregedapp/data/Data_Source/userFunctionality_data_source.dart';
import 'package:ojoregedapp/domain/entity/add_booking_entity.dart';
import 'package:ojoregedapp/domain/use_case/shared_login.dart';
import 'package:ojoregedapp/presentation/Home/component/SizeSelectionCard.dart';
import 'package:ojoregedapp/presentation/Home/provider/dashboard_provider.dart';
import 'package:provider/provider.dart';

class addBooking extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _employeeScheduleId = TextEditingController();
  final TextEditingController _weight = TextEditingController();
  final TextEditingController _orderInstruction = TextEditingController();

  addBooking({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Color.fromRGBO(44, 120, 101, 1),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(5),
                bottomRight: Radius.circular(5),
              ),
            ),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.only(top: 20, left: 30, right: 30, bottom: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.fromLTRB(0, 3, 0, 0),
                            child: Text(
                              'Add Booking',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Size Option",
                       style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),
                      ),
                      SizeSelectionCard()

                    ],
                  ),
                  Text(
                    "Booking Details",
                    style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),
                  ),
                  SizedBox(height: 20,),
                  Card(
                    color: Color.fromRGBO(217, 237, 191, 1),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextFormField(
                            controller: _weight,
                            decoration: InputDecoration(
                              labelText: 'Weight',
                              prefixIcon: Icon(Icons.fitness_center, color: Colors.grey), // Change the icon color as needed
                              filled: true, // Add background color
                              fillColor: Colors.white, // Set background color
                              border: OutlineInputBorder( // Remove border
                                borderSide: BorderSide.none, // Remove border side
                                borderRadius: BorderRadius.circular(10.0), // Add border radius
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter the weight';
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 20),
                          TextFormField(
                            controller: _orderInstruction,
                            decoration: InputDecoration(
                              labelText: 'Order Instruction',
                              prefixIcon: Icon(Icons.info, color: Colors.grey), // Change the icon color as needed
                              filled: true, // Add background color
                              fillColor: Colors.white,// Set background color
                              border: OutlineInputBorder( // Remove border
                                borderSide: BorderSide.none, // Remove border side
                                borderRadius: BorderRadius.circular(10.0), // Add border radius
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter the order instruction';
                              }
                              return null;
                            },
                          ),
                        ],
                      ),
                    ),
                  ),

                  SizedBox(height: 20,),
                  Text(
                    "Available Schedule",
                    style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),
                  ),
                  SizedBox(height: 20,),
                  TextFormField(
                    controller: _employeeScheduleId,
                    decoration: InputDecoration(labelText: 'Employee Schedule'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter the employee schedule';
                      }
                      return null;
                    },
                  ),



                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        int? token = await sharedLogin.getTokenID();
                        AddBookingEntity model = AddBookingEntity(
                          employeeScheduleId: int.tryParse(_employeeScheduleId.text),
                          weight: int.tryParse(_weight.text),
                          size: Provider.of<DashboardProvider>(context, listen: false).selectedSize,
                          orderInstruction: _orderInstruction.text,
                          customerId: token,
                        );
                        await userFunctionalityDataSource.add_booking(model);
                        Get.offNamed('/Home');
                      }
                    },
                    child: Text('Add Booking'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
