import 'dart:developer';

import 'failures.dart';

Future<void> failureHandler({
  required Future<void> Function() task,
  void Function(Failure failure)? onError,
}) async {
  try {
    await task();
  } catch (e, s) {
    if (e is Failure) {
      onError?.call(e);
    } else if (e is FormatException) {
      onError?.call(const UnExpectedFailure("Data format error!"));
    } else {
      log("Error from failure handler: ${e.toString()}", stackTrace: s);
      onError?.call(const UnExpectedFailure("Something went wrong"));
    }
  }
}
