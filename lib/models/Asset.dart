class Asset{
  late String assetName;
  late String assetId;
  late double assetPriceInUSD;

  Asset({
    required this.assetName,
    required this.assetId,
    required this.assetPriceInUSD,
  });

  factory Asset.fromJSON(Map<String,dynamic> json){
    return Asset(
    assetName: json['name'],
    assetId: json['asset_id'],
    assetPriceInUSD: json['price_usd']
    );
  }
}