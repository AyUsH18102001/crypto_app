import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:crypto_app/providers/currencyProvider.dart';
import 'package:provider/provider.dart';

class DropDownMenu extends StatefulWidget {
  @override
  _DropDownMenuState createState() => _DropDownMenuState();
}

class _DropDownMenuState extends State<DropDownMenu> {

  List<Map<String,String>> currency = [
    {'India':'INR'},
    {'United States of America':'USD'},
    {'Japan':'YEN'},
    {'Europe':'EURO'},
  ];

  String selectedCurrency = '';

  List<DropdownMenuItem<String>> get currencyItems{
    List<DropdownMenuItem<String>> data = [];
    for(var i in currency){
      i.forEach((key, value) {
        data.add(DropdownMenuItem(child: Text(key),value:value));
      });
    }
    return data;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedCurrency = currencyItems.first.value.toString();
  }

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
        builder: (BuildContext context, StateSetter setState){
          return Dialog(
            backgroundColor: Theme.of(context).dialogTheme.backgroundColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
            ),
            child: Container(
              height: 100,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 20),
                      child: DropdownButton(
                        value: selectedCurrency,
                        icon: Padding(
                          padding: EdgeInsets.all(7),
                          child: Transform.rotate(angle: -55,child: Icon(Icons.play_arrow,color: Theme.of(context).iconTheme.color,size: 16)),
                        ),
                        dropdownColor: Theme.of(context).dialogTheme.backgroundColor,
                        style: Theme.of(context).textTheme.headline2,
                        onChanged: (String? newValue){
                          setState(() {
                            selectedCurrency = newValue!;
                          });
                          Provider.of<CurrencyProvider>(context,listen:false).selectedCurrency = newValue!;
                        },
                        items: currencyItems,
                      )
                  ),
                ],
              ),
            ),
          );
        }
    );
  }
}
