import 'package:get/get.dart';
import 'package:test1/api/api_handler.dart';
import 'package:test1/net_work/http_handler.dart';

class HomePageController extends GetxController {
  HttpHandler httpHandler = Get.put(HttpHandler());
  late Future<List<ApiHandlerPhoto>> photoList;

  @override
  void onInit() {
    super.onInit();

    photoList = httpHandler.fetchData();
  }
}
