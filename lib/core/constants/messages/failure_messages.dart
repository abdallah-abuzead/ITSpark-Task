import 'package:easy_localization/easy_localization.dart';

import '../../errors/failures.dart';

class FailureMessages {
  static const String SERVER_FAILURE_MESSAGE = 'internal_server_error_try_again_later';

  static String getMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return SERVER_FAILURE_MESSAGE.tr();
      default:
        return SERVER_FAILURE_MESSAGE.tr();
    }
  }
}
