import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:hackathon_04_2021_shekels/utils/theme_color_utils.dart';

class AppShimmer extends StatelessWidget {
  final Widget child;

  const AppShimmer({
    Key key,
    @required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey,
      highlightColor: Colors.grey[100],
      child: this.child,
    );
  }
}
