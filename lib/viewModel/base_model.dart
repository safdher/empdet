import 'package:flutter/material.dart';

class BaseModel extends ChangeNotifier {
  bool _busy = false;
  bool get busy => _busy;
  get width => MediaQuery.of(context).size.width;
  get height => MediaQuery.of(context).size.height;
  
  late BuildContext context;

  BaseModel() {
    initState();
  }

  void setBusy(bool value) {
    _busy = value;
    notifyListeners();
  }

  void initState() async {

  }

  @override
  void dispose() {
    super.dispose();
  }
}
