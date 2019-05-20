import 'package:flutter/cupertino.dart';
import 'package:keyboard_visibility/keyboard_visibility.dart';

class ZoomInOutImage extends StatefulWidget {
  final String assetName;
  final double height;
  final double width;

  const ZoomInOutImage({
    Key key,
    @required this.assetName,
    this.height,
    this.width,
  }) : super(key: key);

  @override
  _ZoomInOutImageState createState() => _ZoomInOutImageState();
}

class _ZoomInOutImageState extends State<ZoomInOutImage> {
  bool _isKeyboardOpen = false;

  @override
  void initState() {
    super.initState();

    KeyboardVisibilityNotification().addNewListener(
      onChange: (bool visible) {
        setState(() {
          _isKeyboardOpen = visible;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    double _height = 200;
    double _width = MediaQuery.of(context).size.width;

    if (widget.height != null) {
      setState(() {
        _height = widget.height;
      });
    }

    if (widget.width != null) {
      setState(() {
        _width = widget.width;
      });
    }

    return AnimatedContainer(
      curve: Curves.easeInOutExpo,
      duration: Duration(milliseconds: 500),
      alignment: _isKeyboardOpen ? Alignment.centerLeft : Alignment.center,
      margin: EdgeInsets.only(top: 40),
      height: _isKeyboardOpen ? 75 : _height,
      width: _isKeyboardOpen ? _width : 100,
      child: Image.asset(
        widget.assetName,
        filterQuality: FilterQuality.high,
      ),
    );
  }
}
