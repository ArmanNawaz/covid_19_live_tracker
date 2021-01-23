import 'package:flutter/material.dart';
import 'package:covid19livedata/utilities/constants.dart';

class NavigationOption extends StatelessWidget {
  final String title;
  final bool selected;
  final Function() onSelected;

  NavigationOption(
      {@required this.title,
      @required this.selected,
      @required this.onSelected});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onSelected();
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(
              color: selected ? Colors.white : Colors.grey.shade700,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          selected
              ? Column(
                  children: <Widget>[
                    SizedBox(
                      height: 12,
                    ),
                    Container(
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                        color: Colors.blueAccent,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ],
                )
              : Container(),
        ],
      ),
    );
  }
}
