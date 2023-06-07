import 'package:flutter/material.dart';
import 'package:lask/Presentation/Constants.dart';
import 'Constants.dart';
import 'CustomeTexts.dart';

class ButtonTab extends StatefulWidget {
  ButtonTab({super.key, required this.currentIndex, required this.items});
  int currentIndex;
  final List<String> items;
  @override
  State<ButtonTab> createState() => _ButtonTabState();
}

class _ButtonTabState extends State<ButtonTab> {
  // var currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: Container(
          color: white,
          height: 35,
          width: DP.infinity(context),
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: widget.items.length,
              itemBuilder: (ctx, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      widget.currentIndex = index;
                    });
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        // width: 86,
                        height: 35,

                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey.shade300),
                            color: widget.currentIndex == index
                                ? lightblue
                                : white,
                            borderRadius: BorderRadius.circular(20)),
                        child: Center(
                          child: TextFW700(
                            text: widget.items[index],
                            fontSize: 14,
                            textcolor:
                                widget.currentIndex == index ? black : black,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      const SizedBox(width: 10)
                    ],
                  ),
                );
              }),
        ),
      ),
    );
  }
}
