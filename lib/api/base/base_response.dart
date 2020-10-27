class BaseResponse<T> {
  BaseResponse._();

  factory BaseResponse.success(T value) = BaseSuccessResponse<T>;

  factory BaseResponse.error(T value) = BaseErrorResponse<T>;
}

class BaseSuccessResponse<T> extends BaseResponse<T> {
  BaseSuccessResponse(this.value) : super._();
  final T value;
}

class BaseErrorResponse<T> extends BaseResponse<T> {
  BaseErrorResponse(this.msg) : super._();
  final T msg;
}



