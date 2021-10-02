import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class Meal extends StatefulWidget {
  final row;
  const Meal({Key? key, required this.row}) : super(key: key);

  @override
  _MealState createState() => _MealState();
}

class _MealState extends State<Meal> {
  @override
  Widget build(BuildContext context) {
    int itemsCount = 10;
    Widget chickenImages = SizedBox(
      height: 160,
      child: Image.asset("assets/images/chicken burger.png"),
    );
    Widget baconImage = SizedBox(
      height: 180,
      child: Image.asset("assets/images/bacon burger.png"),
    );
    return SliverToBoxAdapter(
      child: Container(
        height: widget.row == 2 ? 350 : 250,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: itemsCount,
            itemBuilder: (context, index) {
              bool reverse = widget.row == 2 ? index.isEven : index.isOdd;
              return Stack(
                children: [
                  Container(
                    height: 240,
                    width: 200,
                    margin: EdgeInsets.only(
                        left: 30, right: index == itemsCount ? 20 : 0),
                    child: Card(
                      elevation: 5,
                      margin: const EdgeInsets.all(10),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(45),
                          bottomRight: Radius.circular(15),
                          topLeft: Radius.circular(45),
                          topRight: Radius.circular(45),
                        ),
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: Text(
                              reverse ? "chicken burger" : "bacon burger",
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          const Spacer(),
                          Row(
                            children: [
                              const Spacer(),
                              const Text(
                                "1.99 \$ JD",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const Spacer(),
                              Container(
                                width: 50,
                                height: 50,
                                child: Card(
                                  child: const Icon(Icons.add),
                                  color: Theme.of(context).primaryColor,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15)),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  //add images
                  Positioned(
                    top: reverse ? 60 : 40,
                    left: reverse ? 0 : 0,
                    child: reverse ? chickenImages : baconImage,
                  )
                ],
              );
            }),
      ),
    );
  }
}
