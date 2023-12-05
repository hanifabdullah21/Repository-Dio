import 'package:example/app/data/example_model.dart';
import 'package:get/get.dart';
import 'package:repository_dio/repository/repository.dart';
import 'package:repository_dio/repository/repository_options.dart';

class HomeController extends GetxController {
  Repository repository = Get.find();

  final result = "".obs;

  testGet() {}

  testListGet() {
    repository.get<List<ExampleModel>, ExampleModel>(
      options: RepositoryOptions(
          endpoint: "api/test-get-list",
          query: {"success": true},
          mapperObjectFromList: ExampleModel.fromJson,
          onSuccess: (data) {
            result.value = "${data.data}";
          },
          onError: (data) {
            result.value = "${data.failure?.msgShow}";
          }),
    );
  }
}
