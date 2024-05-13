import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;
import 'package:recipe_teller/fridge/add_category.dart';

class MockHttpClient extends Mock implements http.Client {}

void main() {
  group('CategoryProvider Test', () {
    test('addCategory success test', () async {
      final mockClient = MockHttpClient();
      final categoryProvider = CategoryProvider();

      // Stubbing the http post request to return a success response
      when(mockClient.post(
        Uri.parse("http://172.31.36.248:8000/apis/v1/categories/"),
        headers: {"Content-Type": "application/json"},
        body: json.encode(Category(category: "Test Category")),
      )).thenAnswer((_) async =>
          http.Response('{"id": "1", "name": "Test Category"}', 201));

      // Inject the mocked client into the categoryProvider
      categoryProvider.client = mockClient;

      // Call the addCategory method
      final result = await categoryProvider
          .addCategory(Category(category: "Test Category"));

      // Verify that the http post request was made with the correct parameters
      verify(mockClient.post(
        Uri.parse("http://172.31.36.248:8000/apis/v1/categories/"),
        headers: {"Content-Type": "application/json"},
        body: json.encode(Category(category: "Test Category")),
      )).called(1);

      // Verify that the result is true (success)
      expect(result, true);
    });

    test('addCategory failure test', () async {
      final mockClient = MockHttpClient();
      final categoryProvider = CategoryProvider();

      // Stubbing the http post request to return a failure response
      when(mockClient.post(
        Uri.parse("http://172.31.36.248:8000/apis/v1/categories/"),
        headers: {"Content-Type": "application/json"},
        body: json.encode(Category(category: "Test Category")),
      )).thenAnswer((_) async =>
          http.Response('{"error": "Failed to add category"}', 400));

      // Inject the mocked client into the categoryProvider
      categoryProvider.client = mockClient;

      // Call the addCategory method
      final result = await categoryProvider
          .addCategory(Category(category: "Test Category"));

      // Verify that the http post request was made with the correct parameters
      verify(mockClient.post(
        Uri.parse("http://172.31.36.248:8000/apis/v1/categories/"),
        headers: {"Content-Type": "application/json"},
        body: json.encode(Category(category: "Test Category")),
      )).called(1);

      // Verify that the result is false (failure)
      expect(result, false);
    });
  });
}
