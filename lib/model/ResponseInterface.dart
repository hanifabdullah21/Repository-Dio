import 'package:repository_dio/model/StatusRequestModel.dart';

abstract class ResponseInterface<T> {
  onLoading(StatusRequestModel<T> response);

  onSuccess(StatusRequestModel<T> response);

  onError(StatusRequestModel<T> response);
}
