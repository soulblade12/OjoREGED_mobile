import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:ojoregedapp/presentation/Home/component/subscription_plan.dart';

class Home extends StatelessWidget {
  const Home({Key? key});

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
          Container(
           decoration: const BoxDecoration(
           color: Color.fromRGBO(44, 120, 101, 1),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30),
            ),
          ),
          child: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(
              top: 30,
              left: 30,
              right: 30,
              bottom: 30,
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                  Icon(Icons.person_pin,size: 60,color: Colors.white),
                    SizedBox(
                      width: 30,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.location_on,color: Colors.white),
                            SizedBox(width: 5,),
                            Text("Terban, Yogyakarta",style: TextStyle(color: Colors.white,))
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(0,3,0,0),
                          child: Text(
                            'Morning, ',
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
              ],
            ),
        ),
    ],
    ),
    ),
      SizedBox(height: 40),
            GestureDetector(
              onTap: () {
                Get.toNamed('/AddBook');
              },
              child: Card(
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Container(
                        color: Colors.white,
                        height: 130,
                        width: 150,
                        padding: EdgeInsets.all(16.0),
                        child: Center(
                          child: Text(
                            "Add Booking",
                            textAlign: TextAlign.right,
                          ),
                        ),
                      ),
                      Container(
                        height: 130,
                        width: 150,
                        decoration: BoxDecoration(
                          gradient: RadialGradient(
                            colors: [
                              Color.fromRGBO(217, 237, 191, 1),
                              Color.fromRGBO(144, 210, 109, 1)
                            ],
                            center: Alignment(0, 0),
                            radius: 0.8,
                            focal: Alignment(0, 0),
                            focalRadius: 0.1,
                          ),
                        ),
                        padding: EdgeInsets.all(8.0),
                        child: Center(
                          child: Image.asset("assets/onboarding/Asset6.png"),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // Subscription Plans
            Row(
              children: [
                const Padding(
                  padding: const EdgeInsets.all(25),
                  child: Text(
                    'Available Subscription Plans',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(16),
                  child: ElevatedButton(
                    onPressed: () {
                      Get.toNamed("/AddSubscribe");
                    },
                    child: Text('Subscribe'),
                  ),
                ),
              ],
            ),

                  Container(
                    height: 200,
                      child: Subscription()
                  ),
        ],
        ),
      ),
    );
  }
}
