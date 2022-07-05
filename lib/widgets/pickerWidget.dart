import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:crypto_app/providers/currencyProvider.dart';
import 'package:provider/provider.dart';

class PickerWidget extends StatefulWidget {
  @override
  _PickerWidgetState createState() => _PickerWidgetState();
}

class _PickerWidgetState extends State<PickerWidget> {

  List<Map<String,String>> currency = [
    {'India':'INR'},
    {'United States of America':'USD'},
    {'Japan':'YEN'},
    {'Europe':'EURO'},
  ];

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
        builder: (BuildContext context, StateSetter setState){
          return Container(
            decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(45),
                  topLeft: Radius.circular(45),
                )
            ),
            height: MediaQuery.of(context).size.height/4,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Container(
                    width: MediaQuery.of(context).size.width/5,
                    height: 3,
                    decoration: BoxDecoration(
                      color: Theme.of(context).iconTheme.color,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height/4.9,
                  child: CupertinoPicker(
                    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                    itemExtent: 65,
                    children: currency.map((data){
                      return Center(
                        child: Text(
                            data.values.elementAt(0),
                            style: Theme.of(context).textTheme.headline2
                        ),
                      );
                    }).toList(),
                    onSelectedItemChanged: (int index){
                      Provider.of<CurrencyProvider>(context,listen: false).selectedCurrency = currency.elementAt(index).values.elementAt(0);
                    },
                  ),
                )
              ],
            ),
          );
        }
    );
  }
}
