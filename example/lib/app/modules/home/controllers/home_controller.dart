import 'package:example/app/data/example_model.dart';
import 'package:get/get.dart';
import 'package:repository_dio/repository/repository.dart';
import 'package:repository_dio/repository/repository_options.dart';

class HomeController extends GetxController {
  Repository repository = Get.find();

  final result = "".obs;

  testGet() {
    repository.get<ExampleModel, ExampleModel>(
      options: RepositoryOptions(
        endpoint: "api/test-get",
        query: {"success": true},
        data: {},
        mapperObject: ExampleModel.fromJson,
        onLoading: (data, isLoading) {},
        onSuccess: (data) {},
        onError: (data) {},
        onSendProgress: (count, total) {},
        onReceiveProgress: (count, total) {},
      ),
    );
  }

  testListGet() {
    repository.get<List<ExampleModel>, ExampleModel>(
      options: RepositoryOptions(
        endpoint: "api/test-get-list",
        query: {"success": true},
        data: {},
        mapperObjectFromList: ExampleModel.fromJson,
        onLoading: (data, isLoading) {},
        onSuccess: (data) {},
        onError: (data) {},
        onSendProgress: (count, total) {},
        onReceiveProgress: (count, total) {},
      ),
    );
  }
}
