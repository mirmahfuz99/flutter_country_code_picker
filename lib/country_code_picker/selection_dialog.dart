import 'celement.dart';
import 'package:flutter/material.dart';

/// selection dialog used for selection of the country code
class SelectionDialog extends StatefulWidget {
  final List<CElement> elements;

  /// elements passed as favorite
  final List<CElement> favoriteElements;

  SelectionDialog(this.elements, this.favoriteElements);

  @override
  State<StatefulWidget> createState() => new _SelectionDialogState();
}

class _SelectionDialogState extends State<SelectionDialog> {
  /// this is useful for filtering purpose
  List<CElement> showedElements = [];

  @override
  Widget build(BuildContext context) =>
      new SimpleDialog(
          title: new Column(
            children: <Widget>[
                new Text('Select Country',
//                style: new TextStyle(color: Colors.black45),
              ),
              new TextField(
                decoration: new InputDecoration(
                    prefixIcon: new Icon(Icons.search),
//                    hintText: 'Select country/region code'
                ),
                onChanged: _filterElements,
              ),
            ],
          ),
          children: [
            new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[]
                  ..addAll(showedElements.map((e) {
                    return new SimpleDialogOption(
                        child: Flex(
                          direction: Axis.horizontal,
                          children: <Widget>[

                            Flexible(
                              fit: FlexFit.tight,
                              child: new Text(
                                e.toShortString(),
                                overflow: TextOverflow.fade,
                              ),
                            ),

                            new Text(e.toString()),
                          ],
                        ),
                        onPressed: () {
                          _selectItem(e);
                        });
                  }).toList())),
          ]
      );

  @override
  void initState() {
    showedElements = widget.elements;
    super.initState();
  }

  void _filterElements(String s) {
    s = s.toUpperCase();
    setState(() {
      showedElements = widget.elements
          .where((e) =>
      e.code.contains(s) ||
          e.dialCode.contains(s) ||
          e.name.toUpperCase().contains(s))
          .toList();
    });
  }

  void _selectItem(CElement e) {
    Navigator.pop(context, e);
  }
}



