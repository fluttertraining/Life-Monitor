import 'package:flutter/material.dart';

class RoundedAppBar extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry padding;
  final double height;
  final bool isAnimated;

  const RoundedAppBar({
    Key key,
    @required this.child,
    this.padding,
    this.height,
    this.isAnimated = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget _buildContainer(Widget child) {
      return this.isAnimated
          ? AnimatedContainer(
              duration: Duration(milliseconds: 500),
              curve: Curves.easeInOutExpo,
              height: height != null ? height : 75,
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width,
              padding: padding != null
                  ? padding
                  : EdgeInsets.only(left: 28.0, right: 28.0),
              child: child,
            )
          : Container(
              height: height != null ? height : 75,
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width,
              padding: padding != null
                  ? padding
                  : EdgeInsets.only(left: 28.0, right: 28.0),
              child: child,
            );
    }

    return Material(
      color: Colors.white,
      elevation: 2.0,
      shadowColor: Colors.grey[100],
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(20.0),
        bottomRight: Radius.circular(20.0),
      ),
      child: _buildContainer(this.child),
    );
  }
}
