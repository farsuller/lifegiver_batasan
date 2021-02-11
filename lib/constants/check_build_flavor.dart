class BuildFlavor{


  static var adNativeIDForgotPassword = "ca-app-pub-7246721390383587/6371397658";
  static var adNativeIDHomeDashboard = "ca-app-pub-7246721390383587/2751716842";
  static var adNativeIDTest = "ca-app-pub-3940256099942544/8135179316";
  static var isDebug = false;

  static checkDebugMode(){
    assert((){
      //test nativeId
      adNativeIDForgotPassword = adNativeIDTest;
      adNativeIDHomeDashboard = adNativeIDTest;
      isDebug = true;
      return true;
    }());
  }
}