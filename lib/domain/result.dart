class Result<TResult, TFailure> {
  const Result({
    required this.result,
    required this.isSuccess,
    required this.failure,
  });

  final TResult? result;
  final bool isSuccess;
  final TFailure? failure;

  factory Result.success(TResult result) => Result(
        result: result,
        isSuccess: true,
        failure: null,
      );

  factory Result.fail(TFailure failure) => Result(
        result: null,
        isSuccess: false,
        failure: failure,
      );
}
