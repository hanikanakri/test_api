import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test1/api/api_handler.dart';
import 'package:test1/controller/homepagecontroller.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomePageController controller = Get.put(HomePageController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Test API'),
      ),
      body: FutureBuilder(
          future: controller.photoList,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.separated(
                  itemBuilder: (context, index) {
                    return buildCard(snapshot.data![index]);
                  },
                  separatorBuilder: (context, index) {
                    return const Divider();
                  },
                  itemCount: snapshot.data!.length);
            } else if (snapshot.hasError) {
              return const Center(
                child: Text('Something get wrong'),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }

  buildCard(ApiHandlerPhoto apiHandlerPhoto) {
    return Card(
      elevation: 7,
      margin: const EdgeInsets.only(left: 16, right: 16),
      child: Container(
        height: 100,
        padding: const EdgeInsets.all(8),
        alignment: Alignment.center,
        child: ListTile(
          title: Text(apiHandlerPhoto.title),
          leading: CircleAvatar(child: Image.network(apiHandlerPhoto.url),),
        ),
      ),
    );
  }
}
