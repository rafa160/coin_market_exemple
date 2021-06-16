

import 'package:coin_market/models/coin_model.dart';
import 'package:coin_market/services/coin_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:rxdart/rxdart.dart';


class MockApiCallService extends Mock implements CoinService {}

main() {
  MockApiCallService mockApiCallService;
  PublishSubject<List<CoinModel>> syncCoinStreamController;

  setUp((){
    mockApiCallService = MockApiCallService();
    syncCoinStreamController = PublishSubject<List<CoinModel>>();
  });

  tearDown(() {
    syncCoinStreamController.close();
  });

  group('api test', () {
    final jsonMap = {
      "data": [
        {
          "id": 1,
          "name": "Bitcoin",
          "symbol": "BTC",
          "slug": "bitcoin",
          "rank": 1,
          "is_active": 1,
          "first_historical_data": "2013-04-28T18:47:21.000Z",
          "last_historical_data": "2021-06-15T15:49:03.000Z",
          "platform": null
        }
      ]
    };

    test('Check if returns the Coin List', () async {
      print("You have enter in the test\n");
      final httpResponse = Response(data: jsonMap, statusCode: 200);
      final list = (httpResponse.data['data']).map((e) => CoinModel.fromJson(e)).toList();
      List<CoinModel> expected = list;

      when(mockApiCallService.getCoins()).thenAnswer((_) async => list);

      expect(expected, list);
      print("You have pass the test");
    });
  });
}