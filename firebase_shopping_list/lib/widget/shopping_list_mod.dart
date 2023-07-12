
// ignore_for_file: unused_result

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
    int? price = widget.data.price;
    int? count = widget.data.count;
    String? unit = widget.data.unit;


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
                    name= (value==widget.data.name)?null:value;
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
                              price = 0;
                          } else {
                            int val = int.parse(value);
                            price= (val==widget.data.price)?null:val;
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
                          if (value == null || value.isEmpty) {
                              count = 0;
                          } else {
                            int val = int.parse(value);
                            count= (val==widget.data.count)?null:val;
                          }
                        },
                        maxLines:   1,
                        maxLength: 14,
                        initialValue: count.toString(),
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
                            if (value == null || value.isEmpty) {
                              unit = 'шт.';
                            } else {
                              unit = (value == widget.data.unit) ? null : value;
                            }
                          },
                          maxLines:   1,
                          maxLength: 3,
                          initialValue: unit,
                          keyboardType: TextInputType.text,
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(RegExp(r'^[a-zA-Z0-9а-яА-Я _]+$')),
                            LengthLimitingTextInputFormatter(3),
                          ],
                        ),
                      ),
                    ),
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
                      _formKey.currentState?.save();
                      Navigator.pop(context, (StatusOfAddingPurchases.add,
                      widget.data.copyWith(
                        name: null == name? widget.data.name : name!,
                        price: null == price? widget.data.price : price!,
                        count: null == count? widget.data.count : count!,
                        unit: null == unit? widget.data.unit : unit!,
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
                      _formKey.currentState?.save();
                      Navigator.pop(context, (StatusOfAddingPurchases.mod,
                      widget.data.copyWith(
                        name: null == name? widget.data.name : name!,
                        price: null == price? widget.data.price : price!,
                        count: null == count? widget.data.count : count!,
                        unit: null == unit? widget.data.unit : unit!,
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
