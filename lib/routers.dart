import 'home_page.dart';
import 'btn1_page.dart';

class Routers {
  static String root = "/"; //跟页面必须定义为这个样式
  static String page1 = "/page1";
  static final routers = {
    root: (context) => const HomePage(),
    page1: (context) => const NewRoute(),
  };

/*   static onGenerateRoute(RouteSettings settings) {
    //统一处理
    final String? name = settings.name;
    debugPrint('YM------>路由名字:$name');
    final Function pageContentBuilder = routers[name] as Function;
    if (settings.arguments != null) {
      final Route route = MaterialPageRoute(
          builder: (context) =>
              pageContentBuilder(context, arguments: settings.arguments));
      return route;
    } else {
      final Route route =
          MaterialPageRoute(builder: (context) => pageContentBuilder(context));
      return route;
    }
  } */
}
