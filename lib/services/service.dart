import 'dart:convert';

import 'package:crypto_app/models/Asset.dart';
import 'package:crypto_app/utils/constants.dart' as constants;
import 'package:http/http.dart' as http;

class WebService{

  Future<List<Asset>> getAllAssetData() async{
    final String url = constants.Constants.FILTERED_ASSET_LIST_URL+constants.Constants.COINS_TO_BE_FILTERED;
    final Map<String,String> headers = {constants.Constants.API_KEY_HEADER:constants.Constants.API_KEY};
    final response = await http.get(Uri.parse(url),headers: headers);

    if(response.statusCode == 200){
      final jsonDecodedResult = jsonDecode(response.body);
      Iterable list = jsonDecodedResult;
      return list.map((asset) => Asset.fromJSON(asset)).toList();
    }
    else{
      throw Exception('Some error occurred while fetching the assets data');
    }
  }

}