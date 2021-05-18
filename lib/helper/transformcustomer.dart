import 'dart:async';

import 'package:customerdemobloc/models/customer.dart';
int index = 0;
final transform = StreamTransformer<Object, Object>.fromHandlers(
  handleData: (Object li, Sink sink){
    // li.toString().toUpperCase();
     sink.add(li);
  }
);