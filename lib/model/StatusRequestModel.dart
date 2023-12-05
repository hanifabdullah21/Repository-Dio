import 'FailureModel.dart';
import 'StatusRequest.dart';

class StatusRequestModel<T> {
  StatusRequest statusRequest = StatusRequest.none;
  T? data;
  String? message;
  FailureModel? failure;

  StatusRequestModel({
    this.statusRequest = StatusRequest.none,
    this.data,
    this.failure,
    this.message,
  });

  StatusRequestModel.loading({this.message}) {
    statusRequest = StatusRequest.loading;
    data = null;
    failure = null;
  }

  StatusRequestModel.success(T newData, {this.message}) {
    statusRequest = StatusRequest.success;
    data = newData;
    failure = null;
  }

  StatusRequestModel.empty({this.message}) {
    statusRequest = StatusRequest.empty;
    data = null;
    failure = null;
  }

  StatusRequestModel.error(FailureModel error, {this.message}) {
    statusRequest = StatusRequest.error;
    data = null;
    failure = error;
  }
}
