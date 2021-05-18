import 'dart:async';

import 'package:customerdemobloc/helper/transformcustomer.dart';

class CustomerBloc {
  StreamController<Object> _streamController = StreamController<Object>();
  Sink<Object> get inputSink => _streamController.sink;
  Stream get outputStream => _streamController.stream.transform(transform);

  changeToUppercase(Object object){
    inputSink.add(object);
    print('Object is $object');
  }
  @override
  void dispose(){
    _streamController.close();
  }

}