import 'package:dio/dio.dart';
import 'package:guia_moteis/core/http/client.dart';
import 'package:mocktail/mocktail.dart';

class HttpClientMock extends Mock implements HttpClient {}

class MockRequestOptions extends Mock implements RequestOptions {}
