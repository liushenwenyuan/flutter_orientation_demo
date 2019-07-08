import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_orientation_demo/page_portrait.dart';
import 'package:orientation/orientation.dart';

/// create by wenyuan on 2019/7/6
/// Describe：

class LandscapePage extends StatefulWidget {
  int orientation;

  LandscapePage(this.orientation);

  @override
  _LandscapePageState createState() => _LandscapePageState();
}

class _LandscapePageState extends State<LandscapePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("wenyuan LandscapePage initState ${widget.orientation.toString()}");

    ///强制横屏
    OrientationPlugin.forceOrientation(DeviceOrientation.landscapeRight);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    print("wenyuan LandscapePage dispose ${widget.orientation.toString()}");
    if (widget.orientation == 1) {
      ///强制横屏
      OrientationPlugin.forceOrientation(DeviceOrientation.landscapeRight);
    } else {
      ///返回时 设置回竖屏
      OrientationPlugin.forceOrientation(DeviceOrientation.portraitUp);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("LandscapePage"),
      ),
      body: Container(
        color: Colors.green,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                  onPressed: () {
                    int orientation = MediaQuery.of(context).orientation ==
                            Orientation.portrait
                        ? 0
                        : 1;
                    Navigator.push(context,
                        new MaterialPageRoute(builder: (context) {
                      return LandscapePage(orientation);
                    }));
                  },
                  child: Text(("next LandscapePage"))),
              RaisedButton(
                  onPressed: () {
                    int orientation = MediaQuery.of(context).orientation ==
                            Orientation.portrait
                        ? 0
                        : 1;
                    Navigator.push(context,
                        new MaterialPageRoute(builder: (context) {
                      return PortraitPage(orientation);
                    }));
                  },
                  child: Text(("next PortraitPage"))),
            ],
          ),
        ),
      ),
    );
  }
}
