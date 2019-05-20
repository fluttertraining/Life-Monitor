import 'package:flutter/cupertino.dart';
import 'package:keyboard_visibility/keyboard_visibility.dart';

class ZoomInOutImage extends StatefulWidget {

  final String assetName;

  const ZoomInOutImage({
    Key key,
    @required this.assetName,
  })  : super(key: key);


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
    return AnimatedContainer(
      curve: Curves.easeInOutExpo,
      duration: Duration(milliseconds: 500),
      alignment: _isKeyboardOpen ? Alignment.centerLeft : Alignment.center,
      margin: EdgeInsets.only(top: _isKeyboardOpen ? 75 : 40),
      height: _isKeyboardOpen ? 75 : 200,
      width: _isKeyboardOpen ? MediaQuery.of(context).size.width : 100,
      child: Image.asset(widget.assetName),
    );
  }
}