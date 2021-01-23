import 'package:flutter/material.dart';
import 'package:flutter_shimmer/flutter_shimmer.dart';
import 'package:covid19livedata/utilities/constants.dart';

class GlobalLoading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildLoadingCard(),
        buildLoadingCard(),
        buildLoadingCard(),
        buildLoadingCard(),
      ],
    );
  }
}

Widget buildLoadingCard({bool isList}) {
  return Container(
    color: kCardColor,
    child: ListTileShimmer(
      isPurplishMode: true,
      isDarkMode: true,
    ),
  );
}
