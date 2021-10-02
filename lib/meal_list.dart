import 'package:flutter/material.dart';

class MealList extends StatefulWidget {
  const MealList({Key? key}) : super(key: key);

  @override
  _MealListState createState() => _MealListState();
}

class _MealListState extends State<MealList> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    int items = 10;
    return SliverToBoxAdapter(
        child: Container(
      height: 100,
      child: ListView.builder(
          itemCount: items,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => Stack(
                children: [
                  Column(
                    children: [
                      Container(
                        height: 90,
                        width: 90,
                        margin: EdgeInsets.only(
                            left: index == 0 ? 20 : 0, right: 20),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              currentIndex = index;
                            });
                          },
                          child: Card(
                            color: index == currentIndex
                                ? Colors.black.withOpacity(0.7)
                                : Colors.white,
                            child: Icon(Icons.fastfood,
                                color: index == currentIndex
                                    ? Colors.white
                                    : Colors.black.withOpacity(0.7)),
                            margin: const EdgeInsets.all(10),
                            elevation: 5,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                          ),
                        ),
                      )
                    ],
                  ),
                  Positioned(
                    bottom: 0,
                    child: Container(
                      width: 90,
                      margin:
                          EdgeInsets.only(left: index == 0 ? 20 : 0, right: 20),
                      child: Row(
                        children: const [Spacer(), Text("Meals"), Spacer()],
                      ),
                    ),
                  )
                ],
              )),
    ));
  }
}
