import 'package:flutter/cupertino.dart';

class RoundedContainer extends StatelessWidget {
  final Widget child;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final Color? color;
  final double? radius;
  final BorderRadiusGeometry? radiusGeometry;

  const RoundedContainer({
    required this.child,
    this.padding,
    this.margin,
    this.color,
    this.radius = 10,
    this.radiusGeometry,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: child,
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(borderRadius: radiusGeometry ?? BorderRadius.circular(radius!), color: color),
    );
  }
}
