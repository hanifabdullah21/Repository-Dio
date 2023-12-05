import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:repository_dio/hive/hive_helper.dart';
import 'package:repository_dio/model/DefaultModel.dart';
import 'package:repository_dio/model/FailureModel.dart';
import 'package:repository_dio/model/StatusRequestModel.dart';
import 'package:repository_dio/repository/repository_method.dart';
import 'package:repository_dio/repository/repository_options.dart';

class Repository {
  final _dio = Dio();

  Repository({
    String baseUrl = "https://example.com",
    Map<String, dynamic>? headers,
  }) {
    _dio.options.baseUrl = baseUrl;
    _dio.options.connectTimeout = const Duration(seconds: 60);
    _dio.options.receiveTimeout = const Duration(seconds: 60);
    _dio.interceptors.add(InterceptorsWrapper(onRequest:
        (RequestOptions requestOptions, RequestInterceptorHandler handler) {
      requestOptions.headers["Authorization"] =
          HiveHelper.getData(HiveHelper.hiveToken);
      if (headers != null && headers.isNotEmpty) {
        requestOptions.headers.addAll(headers);
      }
      return handler.next(requestOptions);
    }));
  }

  /// Fungsi ini digunakan untuk melakukan request [GET] ke server.
  ///
  /// Tipe [L] merupakan Tipe Data yang akan menjadi hasil
  /// Tipe [O] merupakan Tipe Data yang akan menjadi hasil jika [L] berupa List<O>
  request<L, O>({
    required RepositoryOptions<L, O> options,
  }) async {
    switch (options.method) {
      case RequestMethod.GET:
        return get(options: options);
      default:
        return null;
    }
  }

  get<L, O>({
    required RepositoryOptions<L, O> options,
  }) async {
    StatusRequestModel<L> statusRequestModel;
    try {
      /// Jalankan loading
      if (options.onLoading != null) {
        options.onLoading!(StatusRequestModel.loading(), true);
      }

      /// Lakukan request
      var response = await _dio.get(
        options.endpoint,
        queryParameters: options.query,
        onReceiveProgress: options.onReceiveProgress,
      );

      /// Hentikan Loading
      if (options.onLoading != null) {
        options.onLoading!(StatusRequestModel.loading(), false);
      }

      return _handleRequest<L, O>(
        response: response,
        mapperObject: options.mapperObject,
        mapperObjectFromList: options.mapperObjectFromList,
        onLoading: options.onLoading,
        onSuccess: options.onSuccess,
        onError: options.onError,
      );
    } on DioException catch (e) {
      statusRequestModel = StatusRequestModel<L>.error(
          FailureModel(
              code: e.response?.statusCode,
              msgShow: e.response?.statusMessage,
              msgSystem: e.response?.statusMessage),
          message: e.response?.statusMessage);
    }
    return statusRequestModel;
  }

  post<L, O>({
    required RepositoryOptions<L, O> options,
  }) async {
    StatusRequestModel<L> statusRequestModel;
    try {
      /// Jalankan loading
      if (options.onLoading != null) {
        options.onLoading!(StatusRequestModel.loading(), true);
      }

      /// Lakukan request
      var response = await _dio.post(
        options.endpoint,
        queryParameters: options.query,
        data: options.data,
        onReceiveProgress: options.onReceiveProgress,
        onSendProgress: options.onSendProgress,
      );

      /// Hentikan Loading
      if (options.onLoading != null) {
        options.onLoading!(StatusRequestModel.loading(), false);
      }

      return _handleRequest<L, O>(
        response: response,
        mapperObject: options.mapperObject,
        mapperObjectFromList: options.mapperObjectFromList,
        onLoading: options.onLoading,
        onSuccess: options.onSuccess,
        onError: options.onError,
      );
    } on DioException catch (e) {
      statusRequestModel = StatusRequestModel<L>.error(
          FailureModel(
              code: e.response?.statusCode,
              msgShow: e.response?.statusMessage,
              msgSystem: e.response?.statusMessage),
          message: e.response?.statusMessage);
    }
    return statusRequestModel;
  }

  put<L, O>({
    required RepositoryOptions<L, O> options,
  }) async {
    StatusRequestModel<L> statusRequestModel;
    try {
      /// Jalankan loading
      if (options.onLoading != null) {
        options.onLoading!(StatusRequestModel.loading(), true);
      }

      /// Lakukan request
      var response = await _dio.put(
        options.endpoint,
        queryParameters: options.query,
        data: options.data,
        onReceiveProgress: options.onReceiveProgress,
        onSendProgress: options.onSendProgress,
      );

      /// Hentikan Loading
      if (options.onLoading != null) {
        options.onLoading!(StatusRequestModel.loading(), false);
      }

      return _handleRequest<L, O>(
        response: response,
        mapperObject: options.mapperObject,
        mapperObjectFromList: options.mapperObjectFromList,
        onLoading: options.onLoading,
        onSuccess: options.onSuccess,
        onError: options.onError,
      );
    } on DioException catch (e) {
      statusRequestModel = StatusRequestModel<L>.error(
          FailureModel(
              code: e.response?.statusCode,
              msgShow: e.response?.statusMessage,
              msgSystem: e.response?.statusMessage),
          message: e.response?.statusMessage);
    }
    return statusRequestModel;
  }

  delete<L, O>({
    required RepositoryOptions<L, O> options,
  }) async {
    StatusRequestModel<L> statusRequestModel;
    try {
      /// Jalankan loading
      if (options.onLoading != null) {
        options.onLoading!(StatusRequestModel.loading(), true);
      }

      /// Lakukan request
      var response = await _dio.delete(
        options.endpoint,
        queryParameters: options.query,
        data: options.data,
      );

      /// Hentikan Loading
      if (options.onLoading != null) {
        options.onLoading!(StatusRequestModel.loading(), false);
      }

      return _handleRequest<L, O>(
        response: response,
        mapperObject: options.mapperObject,
        mapperObjectFromList: options.mapperObjectFromList,
        onLoading: options.onLoading,
        onSuccess: options.onSuccess,
        onError: options.onError,
      );
    } on DioException catch (e) {
      statusRequestModel = StatusRequestModel<L>.error(
          FailureModel(
              code: e.response?.statusCode,
              msgShow: e.response?.statusMessage,
              msgSystem: e.response?.statusMessage),
          message: e.response?.statusMessage);
    }
    return statusRequestModel;
  }

  download<L, O>({
    required RepositoryOptions<L, O> options,
    required String savePath,
  }) async {
    StatusRequestModel<L> statusRequestModel;
    try {
      /// Jalankan loading
      if (options.onLoading != null) {
        options.onLoading!(StatusRequestModel.loading(), true);
      }

      /// Lakukan request
      var response = await _dio.download(
        options.endpoint,
        savePath,
        queryParameters: options.query,
        data: options.data,
        onReceiveProgress: options.onReceiveProgress,
      );

      /// Hentikan Loading
      if (options.onLoading != null) {
        options.onLoading!(StatusRequestModel.loading(), false);
      }

      return _handleRequest<L, O>(
        response: response,
        mapperObject: options.mapperObject,
        mapperObjectFromList: options.mapperObjectFromList,
        onLoading: options.onLoading,
        onSuccess: options.onSuccess,
        onError: options.onError,
      );
    } on DioException catch (e) {
      statusRequestModel = StatusRequestModel<L>.error(
          FailureModel(
              code: e.response?.statusCode,
              msgShow: e.response?.statusMessage,
              msgSystem: e.response?.statusMessage),
          message: e.response?.statusMessage);
    }
    return statusRequestModel;
  }

  _handleRequest<L, O>({
    required Response<dynamic> response,
    L Function(Map<String, dynamic>)? mapperObject,
    O Function(Map<String, dynamic>)? mapperObjectFromList,
    Function(StatusRequestModel<L> result, bool isLoading)? onLoading,
    Function(StatusRequestModel<L> result)? onSuccess,
    Function(StatusRequestModel<L> result)? onError,
  }) {
    StatusRequestModel<L> statusRequestModel;

    /// Uraikan respon menjadi [ResponseModel]
    var data = ResponseModel.fromJson(response.data);
    debugPrint("$data");

    /// Cek apakah [ResponseModel.success] bernilai [true] atau [false]
    if (data.success == true) {
      /// Cek apakah hasil yang diinginkan berupa [List] atau [Object]
      if (L == List<O>) {
        /// Cek mapperObjectFromList null atau tidak
        var checkMapper = _checkMapper<L, O>(
            type: 1,
            mapperObjectFromList: mapperObjectFromList,
            onError: onError);

        /// Jika mengembalikan null, maka sudah sesuai syarat
        if (checkMapper != null) {
          return checkMapper;
        }

        /// Uraikan data menjadi sebuah hasil yang diinginkan [List<O>]
        var result =
            List<O>.from((data.data).map((u) => mapperObjectFromList!(u))) as L;
        statusRequestModel =
            StatusRequestModel<L>.success(result, message: data.message);
        if (onSuccess != null) {
          onSuccess(statusRequestModel);
        }
      } else {
        /// Cek mapperObject null atau tidak
        var checkMapper =
            _checkMapper(type: 2, mapperObject: mapperObject, onError: onError);

        /// JIka [checkMapper] bernilai null maka sudah sesuai syarat
        if (checkMapper != null) {
          return checkMapper;
        }

        /// Uraikan data menjadi sebuah hasil yang diinginkan
        var result = mapperObject!(data.data);
        statusRequestModel =
            StatusRequestModel<L>.success(result, message: data.message);
        if (onSuccess != null) {
          onSuccess(statusRequestModel);
        }
      }
    } else {
      statusRequestModel = StatusRequestModel<L>.error(
          FailureModel(
            code: response.statusCode,
            msgShow: data.message,
            msgSystem: response.statusMessage,
          ),
          message: data.message);
      if (onError != null) {
        debugPrint("DATA ERROR Success=${statusRequestModel.message}");
        onError(statusRequestModel);
      }
    }
    return statusRequestModel;
  }

  /// Cek Penguraian.
  /// Funsgi akan mengembalikan [null] jika sesuai syarat dan akan mengembalikan
  /// [StatusRequestModel<L>] jika syarat tidak terpenuhi.
  ///
  /// Jika [type] = 1 maka LIST dan 2 maka OBJEK.
  /// [mapperObject] != null jika hasil yang diinginkan berupa OBJEK.
  /// [mapperObjectFromList] != null jika hasil yang diinginkan berupa LIST.
  /// [onError] sebuah fungsi untuk notifikasi jika ada syarat yang tidak terpenuhi
  StatusRequestModel<L>? _checkMapper<L, O>({
    required int type,
    L Function(Map<String, dynamic>)? mapperObject,
    O Function(Map<String, dynamic>)? mapperObjectFromList,
    Function(StatusRequestModel<L> result)? onError,
  }) {
    var result = StatusRequestModel<L>.error(
        FailureModel(code: 500, msgSystem: "Parameter Not Completed"));
    if (type == 1) {
      if (mapperObjectFromList == null) {
        result.failure?.msgShow = "mapperObjectFromList can't null";
        if (onError != null) onError(result);
        return result;
      } else {
        return null;
      }
    } else {
      if (mapperObject == null) {
        result.failure?.msgShow = "mapperObject can't null";
        if (onError != null) onError(result);
        return result;
      } else {
        return null;
      }
    }
  }
}
