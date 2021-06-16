
import 'package:coin_market/models/api_model.dart';
import 'package:coin_market/services/coin_market_api.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

abstract class WebApiBase {

  ///
  /// Using the an Api Model and this Class
  ///  you can easily call on you bloc or service.
  ///

  static final Dio _httpClient = Dio();
  static final String productionHost = CoinMarketApi.coinMarkApiTitle;
  Future<ApiModel> get({
    @required String controller,
    Map<String, dynamic> queryParameters,
  }) async {
    try {
      Map<String, String> headers = {
        ///passar headers da requisicao
        'Content-type': 'application/json',
        'Accept': 'application/json'
      };

      final response = await _httpClient.get(
        productionHost + controller,
        queryParameters: queryParameters,
        options: Options(
          contentType: "application/json",
          headers: headers,
        ),
      );
      return ApiModel.fromJson(response.data);
    } on DioError catch (error) {
      if (error.response != null) {
        var erros = await ApiModel().fromJsonAsync(error.response.data);
        return erros;
      } else {

        return ApiModel(success: false, errors: []);
      }
    } catch (error) {
      if (error.response == null) return ApiModel(success: false, errors: []);
      return await ApiModel().fromJsonAsync(error.response.data);
    }
  }

}
