import 'package:flutter/material.dart';
import 'celement.dart';
import 'country_codes.dart';
import 'selection_dialog.dart';

class CountryCodePicker extends StatefulWidget {
  final Function(CElement) onChanged;
  final String initialSelection;
  final List<String> favorite;
  final TextStyle textStyle;
  final EdgeInsetsGeometry padding;

  CountryCodePicker(
      {this.onChanged,
      this.initialSelection,
      this.favorite,
      this.textStyle,
      this.padding});

  @override
  State<StatefulWidget> createState() {
    List<Map> jsonList = codes;

    List<CElement> elements = jsonList
        .map((s) => new CElement(
              name: s['name'],
              code: s['code'],
              dialCode: s['dial_code'],
              flagUri: 'flags/${s['code'].toLowerCase()}.png',
            ))
        .toList();

    return new _CountryCodePickerState(elements);
  }
}

class _CountryCodePickerState extends State<CountryCodePicker> {
  CElement selectedItem;
  List<CElement> elements = [];
  List<CElement> favoriteElements = [];

  _CountryCodePickerState(this.elements);

  @override
  Widget build(BuildContext context) => new Column(
        children: <Widget>[
          new FlatButton(
            child: Flex(
              direction: Axis.horizontal,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                    child: Text(
                      selectedItem.name,
                      style: TextStyle(
                          fontFamily: "WorkSansSemiBold",
                          fontSize: 17.0,
                          color: Colors.black45),
                    ),
                  ),
                ),
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                    child: Icon(
                      Icons.arrow_drop_down,
                      color: Colors.black45,
                    ),
                  ),
                ),
              ],
            ),
            padding: widget.padding,
            onPressed: _showSelectionDialog,
          ),
          _buildPhonNumber(),
          _buildButton(),
        ],
      );

  Widget _buildPhonNumber() {
    /// Name and Status Part
    return Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 30.0),
        child: Column(
          children: <Widget>[
            TextField(
              style: TextStyle(
                  fontFamily: "WorkSansSemiBold",
                  fontSize: 16.0,
                  color: Colors.black),
              decoration: InputDecoration(
                //border: InputBorder.none,
                //prefixText: '${selectedItem.toString()}  ',
                hintText: "${selectedItem.toString()} 01703907089",
                hintStyle: TextStyle(
                  wordSpacing: 2.0,
                  fontFamily: "WorkSansSemiBold",
                  fontSize: 17.0,
                ),
              ),
            ),
          ],
        ));
  }

  Widget _buildButton() {
    return Center(
      child: Container(
        decoration: new BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(30.0)),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: const Color(0x609968f8),
              offset: Offset(1.0, 6.0),
              blurRadius: 5.0,
            ),
          ],
          gradient: new LinearGradient(
              colors: [
                const Color(0xFF898dfb),
                const Color(0x809968f8),
              ],
              begin: const FractionalOffset(0.2, 0.2),
              end: const FractionalOffset(1.0, 1.0),
              stops: [0.0, 1.0],
              tileMode: TileMode.clamp),
        ),
        child: MaterialButton(
            highlightColor: Colors.transparent,
            splashColor: const Color(0xFF9968f8),
            //shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5.0))),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 20.0, horizontal: 100.0),
              child: Text(
                "  Next  ",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                    fontFamily: "WorkSansNormal"),
              ),
            ),
            onPressed: () => print("Login button pressed")),
      ),
    );
  }

  @override
  initState() {
    if (widget.initialSelection != null) {
      selectedItem = elements.firstWhere(
          (e) =>
              (e.code.toUpperCase() == widget.initialSelection.toUpperCase()) ||
              (e.dialCode == widget.initialSelection.toString()),
          orElse: () => elements[0]);
    } else {
      selectedItem = elements[0];
    }

    favoriteElements = elements
        .where((e) =>
            widget.favorite.firstWhere(
                (f) => e.code == f.toUpperCase() || e.dialCode == f.toString(),
                orElse: () => null) !=
            null)
        .toList();
    super.initState();

    if (mounted) {
      _publishSelection(selectedItem);
    }
  }

  void _showSelectionDialog() {
    showDialog(
      context: context,
      builder: (_) => new SelectionDialog(elements, favoriteElements),
    ).then((e) {
      if (e != null) {
        setState(() {
          selectedItem = e;
        });

        _publishSelection(e);
      }
    });
  }

  void _publishSelection(CElement e) {
    if (widget.onChanged != null) {
      widget.onChanged(e);
    }
  }
}
