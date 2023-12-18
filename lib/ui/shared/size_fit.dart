import 'dart:ui';


class DJSizeFit {
  static double physicalWidth=0.0;
  static double physicalHeight=0.0;
  static double screenWidth=0.0;
  static double dpr=0.0;
  static double rpx=0.0;
  static double px=0.0;
  static double screenHeight=0.0;

  //要去初始化才用
  static void initialize({double standardWidth = 750}) {

    physicalWidth = window.physicalSize.width;
    physicalHeight = window.physicalSize.height;
    dpr=window.devicePixelRatio;
    screenWidth = physicalWidth / dpr;
    screenHeight = physicalHeight / dpr;

    rpx = screenWidth / standardWidth;
    px = screenWidth / standardWidth * 2;


  }
  // 按照像素来设置
  static double setPx(double size) {
    return DJSizeFit.rpx * size * 2;
  }

  // 按照rxp来设置
  static double setRpx(double size) {
    return DJSizeFit.rpx * size;
  }

}

extension SizeFitRpxIntExtension on int {
  double get rpx {
    return DJSizeFit.setRpx(this.toDouble());
  }
}

extension SizeFitRpxDoubleExtension on double {
  double get rpx {
    return DJSizeFit.setRpx(this);
  }
}

extension SizeFitPxIntExtension on int {
  double get px {
    return DJSizeFit.setPx(this.toDouble());
  }
}

extension SizeFitPxDoubleExtension on double {
  double get px {
    return DJSizeFit.setPx(this);
  }
}