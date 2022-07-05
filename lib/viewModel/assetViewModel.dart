import 'package:crypto_app/models/Asset.dart';

class AssetViewModel{
  late final Asset _asset;

  AssetViewModel({required Asset asset}): _asset = asset;

  String get name {
    return _asset.assetName;
  }

  String get assetId {
    return _asset.assetId;
  }

  double get priceInUSD {
    return _asset.assetPriceInUSD;
  }
}