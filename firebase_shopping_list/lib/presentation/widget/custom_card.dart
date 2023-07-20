import 'dart:developer' as developer;

import 'package:firebase_shopping_list/domain/domain.dart';
import 'package:firebase_shopping_list/presentation/widget/widget.dart';
import 'package:flutter/material.dart';



class CustomCard extends StatefulWidget {
  const CustomCard({super.key, required String id, required Purchase purchase}):
  _id = id, _purchase = purchase;

  final String _id;
  final Purchase _purchase;

  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.all(10),
      child: GestureDetector(
        onTap: () async {
          //              = [Add  , Mod , Brk , Rem ,];
          List<bool> vis1 = [
            false,
            true,
            true,
            false,
          ];
          await showCustomDialog(vis1, widget._purchase, context, widget._id);
          developer.log(PurchasesList().toString());
        },
        child: SizedBox(
            width: double.infinity,
            height: 80,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Row(
                  mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: MouseRegion(
                        cursor:
                        SystemMouseCursors.click,
                        child: Text(
                          widget._purchase.toString(),
                          style: TextStyle(
                            backgroundColor: Colors
                                .lightGreenAccent
                                .withOpacity(0.1),
                            decoration: widget._purchase.bought
                                ? TextDecoration
                                .lineThrough
                                : null,
                          ),
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Row(
                          children: [
                            const Text('Buy'),
                            Switch(
                              value: widget._purchase.bought,
                              activeColor: Colors.red,
                              onChanged: (bool value) async {
                                if (widget._purchase.bought != value) {
                                  await PurchasesList.mod(
                                      widget._id,
                                      widget._purchase.copyWith(
                                        bought: value,
                                      ));
                                }
                              },
                            ),
                          ],
                        ),
                        ElevatedButton(
                            onPressed: () async {
                              await PurchasesList.rem(widget._id, widget._purchase.group);
                            },
                            child: const Icon(Icons.remove)),
                      ],
                    ),
                  ],
                ),
              ),
            )),
      ),
    );
  }
}
