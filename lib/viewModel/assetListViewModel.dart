import 'package:crypto_app/models/Asset.dart';
import 'package:crypto_app/services/service.dart';
import 'package:crypto_app/viewModel/assetViewModel.dart';
import 'package:flutter/cupertino.dart';

class AssetListViewModel with ChangeNotifier{
  List<AssetViewModel> assetsList = [];

  Future<void> displayTheAssetsList()async{
    final List<Asset> assets = await WebService().getAllAssetData();
    this.assetsList = assets.map((asset) => AssetViewModel(asset: asset)).toList();
    notifyListeners();
  }
}