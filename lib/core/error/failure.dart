/// Base class for all Failures in the application.
/// Represents a failure scenario that can be returned by repositories
/// or any other data source.
library;

sealed class Failure {
  /// A user-friendly error message to display
  final String message;

  /// Optional error code (HTTP status code, DB code, etc.)
  final String? code;

  /// Constructor for all Failures
  const Failure(this.message, {this.code});
}

// /// API / Network related failures
// class ApiFailure extends Failure {
//   const ApiFailure(super.message, {super.code});

//   /// Factory to create ApiFailure from DioException
//   /// Optional [responseData] can be provided to extract detailed error messages
//   factory ApiFailure.fromDioError(
//     DioException dioException, {
//     dynamic responseData,
//   }) {
//     switch (dioException.type) {
//       case DioExceptionType.connectionTimeout:
//         return const ApiFailure('Connection timed out. Please try again.');
//       case DioExceptionType.sendTimeout:
//         return const ApiFailure(
//           'Request timed out while sending data. Please try again.',
//         );
//       case DioExceptionType.receiveTimeout:
//         return const ApiFailure('Response timed out. Please try again.');
//       case DioExceptionType.badCertificate:
//         return const ApiFailure(
//           'Invalid security certificate. Check your settings.',
//         );
//       case DioExceptionType.badResponse:
//         return _fromResponse(dioException.response, responseData);
//       case DioExceptionType.cancel:
//         return const ApiFailure('Request was cancelled.');
//       case DioExceptionType.connectionError:
//         if (dioException.message?.contains('SocketException') ?? false) {
//           return const ApiFailure(
//             'No internet connection. Please check your network.',
//           );
//         }
//         return const ApiFailure('Unexpected connection error.');
//       case DioExceptionType.unknown:
//         return const ApiFailure('An unknown error occurred. Please try later.');
//     }
//   }

//   /// Factory to create ApiFailure from HTTP response
//   static ApiFailure _fromResponse(Response? response, dynamic data) {
//     final statusCode = response?.statusCode;
//     String message = 'An unexpected error occurred.';

//     try {
//       if (data != null) {
//         if (data is Map<String, dynamic>) {
//           message = data['message'] ?? data['error'] ?? message;
//         } else if (data is String) {
//           message = data;
//         }
//       }
//     } catch (_) {
//       // fallback to default message
//     }

//     return ApiFailure(message, code: statusCode?.toString());
//   }
// }

/// Local storage / cache failures (Hive, SQLite, SharedPreferences)
class CacheFailure extends Failure {
  const CacheFailure(super.message, {super.code});
}

/// Network related failures (e.g., no internet, timeout)
class NetworkFailure extends Failure {
  const NetworkFailure(super.message, {super.code});
}

/// Unknown or unexpected failures
class UnknownFailure extends Failure {
  const UnknownFailure([super.message = 'An unexpected error occurred.']);
}
