import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class SearchHotelCall {
  static Future<ApiCallResponse> call({
    String? searchString = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'search hotel',
      apiUrl:
          'https://iuwrguojbtursgxasmnl.supabase.co/rest/v1/hotel?name=ilike.*$searchString*&select=',
      callType: ApiCallType.GET,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Iml1d3JndW9qYnR1cnNneGFzbW5sIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDc5ODAyNTYsImV4cCI6MjAyMzU1NjI1Nn0.3aTnVAWva05ixzXEK4W6_iDmEWJcjE1ZtbLjsWmuVLw',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Iml1d3JndW9qYnR1cnNneGFzbW5sIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDc5ODAyNTYsImV4cCI6MjAyMzU1NjI1Nn0.3aTnVAWva05ixzXEK4W6_iDmEWJcjE1ZtbLjsWmuVLw',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class SearchHotelWithOwnerCall {
  static Future<ApiCallResponse> call({
    String? searchString = '',
    String? ownerId = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'search hotel with owner',
      apiUrl:
          'https://iuwrguojbtursgxasmnl.supabase.co/rest/v1/hotel?name=ilike.*$searchString*&owner_id@>\$ownerId&select=*',
      callType: ApiCallType.GET,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Iml1d3JndW9qYnR1cnNneGFzbW5sIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDc5ODAyNTYsImV4cCI6MjAyMzU1NjI1Nn0.3aTnVAWva05ixzXEK4W6_iDmEWJcjE1ZtbLjsWmuVLw',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Iml1d3JndW9qYnR1cnNneGFzbW5sIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDc5ODAyNTYsImV4cCI6MjAyMzU1NjI1Nn0.3aTnVAWva05ixzXEK4W6_iDmEWJcjE1ZtbLjsWmuVLw',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class SearchClientsCall {
  static Future<ApiCallResponse> call({
    String? searchString = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'search clients',
      apiUrl:
          'https://iuwrguojbtursgxasmnl.supabase.co/rest/v1/users?network=ilike.*$searchString*&select=*',
      callType: ApiCallType.GET,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Iml1d3JndW9qYnR1cnNneGFzbW5sIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDc5ODAyNTYsImV4cCI6MjAyMzU1NjI1Nn0.3aTnVAWva05ixzXEK4W6_iDmEWJcjE1ZtbLjsWmuVLw',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Iml1d3JndW9qYnR1cnNneGFzbW5sIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDc5ODAyNTYsImV4cCI6MjAyMzU1NjI1Nn0.3aTnVAWva05ixzXEK4W6_iDmEWJcjE1ZtbLjsWmuVLw',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class SendemailCall {
  static Future<ApiCallResponse> call({
    int? requestWrapper,
  }) async {
    const ffApiRequestBody = '''
{
    "id": request_wrapper.id
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'sendemail',
      apiUrl: '25.465.587:465/email',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.TEXT,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}
