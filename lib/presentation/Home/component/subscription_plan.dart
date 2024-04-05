import 'package:flutter/material.dart';
import 'package:ojoregedapp/presentation/Home/provider/dashboard_provider.dart';
import 'package:provider/provider.dart';

class Subscription extends StatelessWidget {
  const Subscription({Key? key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height / 2;
    double width = MediaQuery.of(context).size.width / 1.9;
    Provider.of<DashboardProvider>(context, listen: false).getArticles();
    return Scaffold(
      body: Consumer<DashboardProvider>(
        builder: (context, provider, _) {
          if (provider.subscribes_plan.isEmpty) {
            return Center(child: CircularProgressIndicator());
          } else {
            return ListView(
                scrollDirection: Axis.horizontal, // Set scroll direction to horizontal
                children: [
                  for (final plan in provider.subscribes_plan)
                    if (plan != null)
                      SizedBox(
                        width: 200, // Set a fixed width for the Card
                        child: Stack(
                          children: <Widget>[
                            Container(
                              margin: const EdgeInsets.only(left: 30),
                              height: height,
                              width: width,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(20)),
                                color: Color.fromRGBO(255, 152, 0, 1),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Column(
                                    children: <Widget>[
                                      Align(
                                          alignment: Alignment.topLeft,
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              plan.name,
                                              style:
                                              TextStyle(color: Colors.white, fontSize: 16.0),
                                            ),
                                          )),
                                      Align(
                                        alignment: Alignment.topRight,
                                        child: Container(
                                          margin: const EdgeInsets.only(bottom: 12.0),
                                          padding: const EdgeInsets.fromLTRB(8.0, 4.0, 12.0, 4.0),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(10),
                                                bottomLeft: Radius.circular(10)),
                                            color: Color.fromRGBO(144, 210, 109, 1),
                                          ),
                                          child: Text(
                                            '\$${plan.price}',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            Positioned(
                              child: OverflowBox(
                                alignment: Alignment.bottomLeft,
                                child: Image.asset(
                                  "assets/onboarding/Asset5.png",
                                  height: height / 0.2,
                                  width: width / 1.8,
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                ],
            );
          }
        },
      ),
    );
  }
}
