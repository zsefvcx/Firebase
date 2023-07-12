
import 'package:firebase_shopping_list/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ShoppingListModWidget extends StatefulWidget {
  const ShoppingListModWidget({
    super.key,
    required this.vis,
    required this.data,
  });
  final Purchase data;
  final List<bool> vis;

  @override
  State<ShoppingListModWidget> createState() => _ShoppingListModWidgetState();
}

class _ShoppingListModWidgetState extends State<ShoppingListModWidget> {

  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
  }

  bool? _validateForm(){
    return _formKey.currentState?.validate();
  }


  @override
  Widget build(BuildContext context) {
    String? name = widget.data.name;
    int price = widget.data.price;
    int count = widget.data.count;
    String unit = widget.data.unit;


    return SimpleDialog(
      title: const Center(child: Text('Add a purchase to the Shopping List')),
      children: <Widget>[
        Form(
          key: _formKey,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: TextFormField(
                  decoration: const InputDecoration(
                    icon: Padding(
                      padding: EdgeInsets.only(top: 15.0),
                      child: Icon(Icons.shopping_basket_outlined),
                    ),
                    labelText: 'Purchase *',
                  ),
                  onSaved: (String? value) {
                    // This optional block of code can be used to run
                    // code when the user saves the form.
                    (name==widget.data.name)?null:name;
                    value!=null?name=value:name=widget.data.name;
                  },
                  maxLines:   1,
                  maxLength: 40,
                  initialValue: name,
                  keyboardType: TextInputType.text,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'^[a-zA-Z0-9а-яА-Я _]+$')),
                    LengthLimitingTextInputFormatter(40),
                  ],
                  validator: (String? value) {
                    if(value !=null && value.isEmpty ) return 'Name is required';
                    return (value != null && value.contains('@')) ? 'Do not use the @ char.' : null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: TextFormField(
                        decoration: const InputDecoration(
                          icon: Padding(
                            padding: EdgeInsets.only(top: 15.0),
                            child: Icon(Icons.currency_ruble),
                          ),
                          labelText: 'Price',
                        ),
                        onSaved: (String? value) {
                          if (value == null || value.isEmpty) {
                            setState(() {
                              price = 0;
                            });
                          }
                        },
                        maxLines:   1,
                        maxLength: 14,
                        initialValue: price.toString(),
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          //FilteringTextInputFormatter.digitsOnly,
                          FilteringTextInputFormatter.allow(RegExp(r'^[0-9.]+$')),
                          LengthLimitingTextInputFormatter(14),

                        ],
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: TextFormField(
                        decoration: const InputDecoration(
                          icon: Padding(
                            padding: EdgeInsets.only(left: 15, top: 15.0),
                            child: Icon(Icons.filter_9_plus_outlined),
                          ),
                          labelText: 'Count',
                        ),
                        onSaved: (String? value) {
                          // This optional block of code can be used to run
                          // code when the user saves the form.
                        },
                        maxLines:   1,
                        maxLength: 14,
                        initialValue: widget.data.count.toString(),
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          //FilteringTextInputFormatter.digitsOnly,
                          FilteringTextInputFormatter.allow(RegExp(r'^[0-9.]+$')),
                          LengthLimitingTextInputFormatter(14),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: SizedBox(
                        child: TextFormField(
                          decoration: const InputDecoration(
                            icon: Padding(
                              padding: EdgeInsets.only(left: 15, top: 15.0),
                              child: Icon(Icons.type_specimen_outlined),

                            ),
                            labelText: 'Unit',
                          ),
                          onSaved: (String? value) {
                            // This optional block of code can be used to run
                            // code when the user saves the form.
                            value!=null?unit=value:unit=widget.data.unit;
                          },
                          maxLines:   1,
                          maxLength: 3,
                          initialValue: unit.toString(),
                          keyboardType: TextInputType.text,
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(RegExp(r'^[a-zA-Z0-9а-яА-Я _]+$')),
                            LengthLimitingTextInputFormatter(3),
                          ],
                        ),
                      ),
                    ),
                    // Expanded(
                    //   flex: 1,
                    //   child: Row(
                    //     children: [
                    //       const Text('Bought'),
                    //       Switch(
                    //
                    //         // This bool value toggles the switch.
                    //         value: light,
                    //         activeColor: Colors.red,
                    //         onChanged: (bool value) {
                    //         // This is called when the user toggles the switch.
                    //           setState(() {
                    //             light = value;
                    //           });
                    //         },
                    //       ),
                    //     ],
                    //   ),
                    // ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15, right: 15),
          child: Row(
            children: [
              Visibility(
                visible: widget.vis[0],
                child: Expanded(
                  child: SimpleDialogOption(
                    onPressed: () { if(_validateForm()==true) {
                      Navigator.pop(context, (StatusOfAddingPurchases.add,
                      widget.data.copyWith(
                        name: null == name? widget.data.name : name!,
                        price: price,
                        count: count,
                        unit: unit,
                      ),
                    ));
                    } },
                    child: const Center(child: Text('Add')),
                  ),
                ),
              ),
              Visibility(
                visible: widget.vis[1],
                child: Expanded(
                  child: SimpleDialogOption(
                    onPressed: () { if(_validateForm()==true) {
                      Navigator.pop(context, (StatusOfAddingPurchases.mod,
                      widget.data.copyWith(
                        name: null == name? widget.data.name : name!,
                        price: price,
                        count: count,
                        unit: unit,
                      ),
                    ));
                    } },
                    child: const Center(child: Text('Modify')),
                  ),
                ),
              ),
              Visibility(
                visible: widget.vis[3],
                child: Expanded(
                  child: SimpleDialogOption(
                    onPressed: () { Navigator.pop(context, (StatusOfAddingPurchases.rem, widget.data)); },
                    child: const Center(child: Text('Remove')),
                  ),
                ),
              ),
              Visibility(
                visible: widget.vis[2],
                child: Expanded(
                  child: SimpleDialogOption(
                    onPressed: () { Navigator.pop(context, (StatusOfAddingPurchases.brk, widget.data)); },
                    child: const Center(child: Text('Cancel')),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],

    );
  }
}
