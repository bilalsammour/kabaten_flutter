import 'dart:convert';

import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:kabaten/app/configurations.dart';
import 'package:kabaten/generated/l10n.dart';
import 'package:kabaten/models/shared/general_response.dart';
import 'package:kabaten/services/auth/auth_service.dart';
import 'package:kabaten/services/requests/request_all.dart';

class GlobalRequest {
  final Map<String, String> _headers = {};
  final Map<String, dynamic> _parameters = {};

  bool mocked = false;

  Future<GeneralResponse> sendRequest({
    required RequestType requestType,
    required String api,
    List<int> ignoring = const [],
  }) async {
    try {
      final response = await _makeRequest(requestType, api);

      final statusCheckResult = await _checkStatusCode(
        statusCode: response.statusCode,
        ignoring: ignoring,
      );

      if (statusCheckResult != null) {
        return statusCheckResult;
      }

      final map = convert.jsonDecode(response.body) as Map<String, dynamic>;

      clearParameters();

      return GeneralResponse(
        map: map,
        statusCode: response.statusCode,
      );
    } catch (e) {
      return GeneralResponse.error(e.toString());
    }
  }

  Future<Response> _makeRequest(
    RequestType requestType,
    String api,
  ) async {
    switch (requestType) {
      case RequestType.get:
        return _makeGetRequest(api);

      case RequestType.post:
        return _makePostRequest(api);

      case RequestType.put:
        return _makePutRequest(api);

      case RequestType.patch:
        return _makePatchRequest(api);

      case RequestType.head:
        return _makeHeadRequest(api);

      case RequestType.delete:
        return _makeDeleteRequest(api);

      default:
        return _makeGetRequest(api);
    }
  }

  Future<Response> _makeGetRequest(String api) =>
      http.get(_getUriWithParameters(api), headers: _headers);

  Future<Response> _makePostRequest(String api) async {
    final body = jsonEncode(_parameters);
    return http.post(
      _getUri(api),
      headers: _headers,
      body: body,
    );
  }

  Future<Response> _makePutRequest(String api) async {
    final body = jsonEncode(_parameters);
    return http.put(
      _getUri(api),
      headers: _headers,
      body: body,
    );
  }

  Future<Response> _makePatchRequest(String api) async {
    final body = jsonEncode(_parameters);
    return http.patch(
      _getUri(api),
      headers: _headers,
      body: body,
    );
  }

  Future<Response> _makeHeadRequest(String api) =>
      http.head(_getUriWithParameters(api), headers: _headers);

  Future<Response> _makeDeleteRequest(String api) =>
      http.delete(_getUriWithParameters(api), headers: _headers);

  Future<GeneralResponse?> _checkStatusCode({
    required int statusCode,
    required List<int> ignoring,
  }) async {
    if (statusCode == 401 && !ignoring.contains(401)) {
      AuthService.forceLogout();

      return GeneralResponse.error(S.current.loggedOut);
    }

    return null;
  }

  void addHeader(String key, String value) => _headers[key] = value;

  void addJsonHeader(String value) {
    final map = json.decode(value);
    _headers.addAll(map);
  }

  void addHeaders(Map<String, String> value) => _headers.addAll(value);

  void addParameter(String key, dynamic value) => _parameters[key] = value;

  void addJsonParameter(String value) {
    final map = json.decode(value);
    _parameters.addAll(map);
  }

  void addMapParameters(Map<String, dynamic> value) =>
      _parameters.addAll(value);

  void clearParameters() => _parameters.clear();

  Uri _getUriWithParameters(String api) {
    final sourceUrl = _getUrl(api);

    if (_parameters.isEmpty) {
      return Uri.parse(sourceUrl);
    }

    final parametersUrl = _parameters.entries
        .map(
          (e) => '${e.key}=${e.value.toString()}',
        )
        .join('&');
    final separator = sourceUrl.endsWith('?') ? '' : '?';

    final url = '$sourceUrl$separator$parametersUrl';

    return Uri.parse(url);
  }

  Uri _getUri(String api) => Uri.parse(_getUrl(api));

  String _getUrl(String api) => '${Configurations.apiBase}/$api';
}
