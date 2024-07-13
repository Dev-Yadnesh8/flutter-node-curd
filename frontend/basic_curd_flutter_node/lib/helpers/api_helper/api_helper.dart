import 'package:dio/dio.dart';

class ApiHelper {
  Dio dio = Dio();

  Future<Response> get(String url, {Map<String, dynamic>? headers}) async {
    try {
      Response response = await dio.get(url, options: Options(headers: headers));
      return response;
    } on DioException catch (e) {
      _handleDioError(e);
      return Response(requestOptions: RequestOptions(path: url));
    } catch (e) {
      print('GET request error: $e');
      rethrow;
    }
  }

  Future<Response> post(String url, {Map<String, dynamic>? headers, dynamic body}) async {
    try {
      Response response = await dio.post(
        url,
        data: body,
        options: Options(headers: headers),
      );
      return response;
    } on DioException catch (e) {
      _handleDioError(e);
      return Response(requestOptions: RequestOptions(path: url));
    } catch (e) {
      print('POST request error: $e');
      rethrow;
    }
  }

  Future<Response> put(String url, {Map<String, dynamic>? headers, dynamic body}) async {
    try {
      Response response = await dio.put(
        url,
        data: body,
        options: Options(headers: headers),
      );
      return response;
    } on DioException catch (e) {
      _handleDioError(e);
      return Response(requestOptions: RequestOptions(path: url));
    } catch (e) {
      print('PUT request error: $e');
      rethrow;
    }
  }

  Future<Response> delete(String url, {Map<String, dynamic>? headers, dynamic body}) async {
    try {
      Response response = await dio.delete(
        url,
        data: body,
        options: Options(headers: headers),
      );
      return response;
    } on DioException catch (e) {
      _handleDioError(e);
      return Response(requestOptions: RequestOptions(path: url));
    } catch (e) {
      print('DELETE request error: $e');
      rethrow;
    }
  }

  void _handleDioError(DioException e) {
    String errorDescription = '';
    switch (e.type) {
      case DioExceptionType.cancel:
        errorDescription = "Request to API server was cancelled";
        break;
      case DioExceptionType.connectionTimeout:
        errorDescription = "Connection timeout with API server";
        break;
      case DioExceptionType.sendTimeout:
        errorDescription = "Send timeout in connection with API server";
        break;
      case DioExceptionType.receiveTimeout:
        errorDescription = "Receive timeout in connection with API server";
        break;
      case DioExceptionType.badResponse:
        errorDescription = _handleHttpError(e.response?.statusCode);
        break;
      case DioExceptionType.unknown:
        errorDescription = "Connection to API server failed due to internet connection";
        break;
      case DioExceptionType.badCertificate:
        errorDescription = "SSL certificate error occurred";
        break;
      case DioExceptionType.connectionError:
        errorDescription = "Connection error occurred";
        break;
    }
    print('Dio error: $errorDescription');

    if (e.response?.statusCode == 401) {
      print("Unauthorized. Please log in again.");
    }

    throw e;  // Rethrow the error after logging
  }

  String _handleHttpError(int? statusCode) {
    String errorDescription = "Received invalid status code: $statusCode";
    if (statusCode != null) {
      if (statusCode >= 400 && statusCode < 500) {
        errorDescription = "Client error occurred with status code: $statusCode";
      } else if (statusCode >= 500) {
        errorDescription = "Server error occurred with status code: $statusCode";
      }
    }
    return errorDescription;
  }

}
