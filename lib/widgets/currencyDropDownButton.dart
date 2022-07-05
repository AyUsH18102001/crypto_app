import 'package:crypto_app/providers/currencyProvider.dart';
import 'package:crypto_app/providers/settingsProvider.dart';
import 'package:crypto_app/widgets/dropDownMenu.dart';
import 'package:crypto_app/widgets/pickerWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CurrencyDropDownButton extends StatefulWidget {
  @override
  _CurrencyDropDownButtonState createState() => _CurrencyDropDownButtonState();
}

class _CurrencyDropDownButtonState extends State<CurrencyDropDownButton> {
  @override
  Widget build(BuildContext context) {
    return Consumer<SettingsProvider>(
        builder: (context,value,child){
          return GestureDetector(
            onTap: (){
              if(!value.isIphoneView){
                showDialog(
                    context: context,
                    builder: (context){
                      return DropDownMenu();
                    }
                );
              }
              else{
                showModalBottomSheet(
                    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                    context: context,
                    builder: (BuildContext context){
                      return PickerWidget();
                    }
                );
              }
            },
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height/15.5,
              color: Colors.grey.withOpacity(0.7),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    Provider.of<CurrencyProvider>(context).selectedCurrency,
                    style: Theme.of(context).textTheme.headline2,
                  ),
                  SizedBox(width: 5),
                  Icon(Icons.arrow_drop_down,color: Theme.of(context).iconTheme.color,size: 20)
                ],
              ),
            ),
          );
        }
    );
  }
}
