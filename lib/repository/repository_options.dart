import 'package:repository_dio/repository/repository_method.dart';

import '../model/StatusRequestModel.dart';

class RepositoryOptions<L, O> {
  RequestMethod? method;
  String endpoint;
  Map<String, dynamic>? query;
  Map<String, dynamic>? data;
  L Function(Map<String, dynamic>)? mapperObject;
  O Function(Map<String, dynamic>)? mapperObjectFromList;
  Function(StatusRequestModel<L> result, bool isLoading)? onLoading;
  Function(StatusRequestModel<L> result)? onSuccess;
  Function(StatusRequestModel<L> result)? onError;
  Function(int, int)? onReceiveProgress;
  Function(int, int)? onSendProgress;

  /// [endpoint] merupakan url request
  /// [query] merupakan data parameter yang di-request
  /// [mapperObjectFromList] merupakan sebuah fungsi untuk menguraikan json menjadi object. Wajib digunakan ketika [L] berupa LIST.
  /// [mapperObject] merupakan sebuah fungsi untuk menguraikan json menjadi object. Wajib digunakan ketika [L] berupa object.
  /// [onLoading] sebuah fungsi untuk notifikasi jika permintaan sedang diproses atau selesai
  /// [onSuccess] sebuah fungsi untuk notifikasi jika permintaan berhasil
  /// [onError] sebuah fungsi untuk notifikasi jika permintaan gagal
  /// [onReceiveProgress] sebuah fungsi untuk memantau proses penerimaan. Hanya berfungsi pada [method] GET, POST, PUT
  /// [onSendProgress] sebuah fungsi untuk memantau proses pengiriman. Hanya berfungsi pada [method] POST, PUT
  RepositoryOptions({
    this.method,
    required this.endpoint,
    this.query,
    this.data,
    this.mapperObjectFromList,
    this.mapperObject,
    this.onLoading,
    this.onSuccess,
    this.onError,
    this.onReceiveProgress,
    this.onSendProgress,
  });
}
