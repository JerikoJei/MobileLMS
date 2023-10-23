import 'package:flutter/material.dart';

class VerticalList extends StatelessWidget {
  const VerticalList({super.key, required this.images, required this.titles});
  final String images, titles;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 15, right: 15, bottom: 20),
        child: Container(
          height: 90,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: <Color>[Colors.deepPurple, Colors.deepPurpleAccent])),
          child: Padding(
            padding: const EdgeInsets.only(top: 15, left: 25, bottom: 15),
            child: Row(children: [
              Container(
                height: 115,
                width: 115,
                decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage(images))),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        titles,
                        style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 25),
                      )
                    ]),
              )
            ]),
          ),
        ));
  }
}
