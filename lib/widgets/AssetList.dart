import 'package:crypto_app/viewModel/assetListViewModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:crypto_app/utils/colors.dart' as color;

class AssetsListView extends StatefulWidget {
  @override
  _AssetsListViewState createState() => _AssetsListViewState();
}

class _AssetsListViewState extends State<AssetsListView> {
  List<Color> cardColors = [
    color.ColorPalette.listColor1,
    color.ColorPalette.listColor2,
    color.ColorPalette.listColor3,
  ];
  @override
  Widget build(BuildContext context) {
    return Consumer<AssetListViewModel>(
        builder: (context,value,child){
          return ListView.builder(
              itemCount: value.assetsList.length,
              itemBuilder: (context,i){
                return Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Container(
                    height: MediaQuery.of(context).size.height/9.5,
                    child: Row(
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height/12,
                          width: MediaQuery.of(context).size.height/12,
                          decoration: BoxDecoration(
                            color: getColorForCardIndex(i),
                            borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width),
                          ),
                          child: Center(
                            child: Text(
                              value.assetsList[i].name.substring(0,1),
                              style: Theme.of(context).textTheme.headline4
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  value.assetsList[i].name,
                                  textAlign: TextAlign.start,
                                  style: Theme.of(context).textTheme.headline2,
                                ),
                                SizedBox(width: 4),
                                Text(
                                  value.assetsList[i].assetId,
                                  textAlign: TextAlign.start,
                                  style: Theme.of(context).textTheme.headline6,
                                ),
                              ],
                            ),
                            Text(
                              '\$${value.assetsList[i].priceInUSD.toStringAsFixed(4)}',
                              style: Theme.of(context).textTheme.headline5,
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                );
              }
          );
        }
    );
  }

  Color getColorForCardIndex(int i) {  //this function will return the color for the particular index of the card
    if (i < cardColors.length){  //base condition
      return cardColors[i];
    }
    return getColorForCardIndex(i%3);  // if index is greater than length of the color list, just pass the mod of that index with 3
  }
}
