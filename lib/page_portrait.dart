import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_orientation_demo/page_landscape.dart';
import 'package:orientation/orientation.dart';

/// create by wenyuan on 2019/7/6
/// Describe：

class PortraitPage extends StatefulWidget {
  int orientation;

  PortraitPage(this.orientation);
  @override
  _PortraitPage createState() => _PortraitPage();
}

class _PortraitPage extends State<PortraitPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("wenyuan PortraitPage initState ${widget.orientation.toString()}");

    ///强制竖屏
    OrientationPlugin.forceOrientation(DeviceOrientation.portraitUp);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

    print("wenyuan PortraitPage dispose ${widget.orientation.toString()}");
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
        title: Text("PortraitPage"),
      ),
      body: Container(
        color: Colors.red,
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
