import 'package:crypto_app/viewModel/assetListViewModel.dart';
import 'package:crypto_app/views/settingsPage.dart';
import 'package:crypto_app/widgets/AssetList.dart';
import 'package:crypto_app/widgets/currencyDropDownButton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<AssetListViewModel>(context,listen: false).displayTheAssetsList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        title: Text(
          'Crypto App',
          style: Theme.of(context).textTheme.headline1,
        ),
        actions: [
          GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>SettingsPage()));
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Icon(
                Icons.settings,
                color: Theme.of(context).appBarTheme.actionsIconTheme!.color,
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: CurrencyDropDownButton(),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24,vertical: 10),
          child: AssetsListView(),
        ),
      )
    );
  }
}