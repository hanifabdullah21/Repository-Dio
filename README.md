# repository_dio

repository_dio merupakan sebuah modul Repository dengan memanfaatkan Dio yang telah dikustom.

## Getting Started

### Install

Karena tidak dipublish silahkan install dengan cara menambahkan kode berikut ke dalam dependencies anda

```yaml
repository_dio:
  git:
    url: https://github.com/hanifabdullah21/Repository-Dio.git
    ref: main
```

### Setup

Karena menggunakan `Hive` silahkan inisiasi terlebih dahulu di `main.dart`

```dart
import 'package:repository_dio/hive/hive_helper.dart';
import 'package:repository_dio/repository_dio.dart';

///init Konfigurasi HIVE
await Hive.initFlutter();
await Hive.openBox<dynamic>(HiveHelper.hiveAppName);
```

Jika anda mengombinasikan `repository_dio` dengan `GetX` silahkan inisiasi seperti ini :

```dart
import 'package:repository_dio/repository/repository.dart';

runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      initialBinding: BindingsBuilder(() {
        ///inisiasi Repository
        Get.put(Repository(baseUrl: "YOUR BASE URL OF API"));
      }),
    ),
  );
```

### Cara Penggunaan

Terdapat 3 penggunaan untuk modul ini :

1. Jika respon yang diinginkan berupa `List`

```dart
Repository repository = Get.find();
repository.get<List<ExampleModel>, ExampleModel>(
      options: RepositoryOptions(
        endpoint: "",
        query: {},
        data: {},
        mapperObjectFromList: ExampleModel.fromJson,
        onLoading: (data, isLoading) {},
        onSuccess: (data) {},
        onError: (data) {},
        onSendProgress: (count, total) {},
        onReceiveProgress: (count, total) {},
      ),
    );
```

2. Jika respon yang diinginkan berupa `Objek`

```dart
Repository repository = Get.find();
repository.get<ExampleModel, ExampleModel>(
      options: RepositoryOptions(
        endpoint: "",
        query: {},
        data: {},
        mapperObject: ExampleModel.fromJson,
        onLoading: (data, isLoading) {},
        onSuccess: (data) {},
        onError: (data) {},
        onSendProgress: (count, total) {},
        onReceiveProgress: (count, total) {},
      ),
    );
```

3. Jika respon yang diinginkan berupa `List` Primitive : `List<String>` , `List<int>` dan `List<double>`

```dart
Repository repository = Get.find();
repository.get<ExampleModel, ExampleModel>(
      options: RepositoryOptions(
        endpoint: "",
        query: {},
        data: {},
        mapperObjectFromListPrimitive: List<String>.from,
        onLoading: (data, isLoading) {},
        onSuccess: (data) {},
        onError: (data) {},
        onSendProgress: (count, total) {},
        onReceiveProgress: (count, total) {},
      ),
    );
```

>Ganti ExampleModel dengan Model anda.

>Terdapat 4 Method yang saat ini dapat digunakan : `get` , `post` , `put` , `delete`


