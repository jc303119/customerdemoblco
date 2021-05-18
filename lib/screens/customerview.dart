import 'package:customerdemobloc/helper/customerbloc.dart';
import 'package:customerdemobloc/models/customer.dart';
import 'package:flutter/material.dart';

class CustomerView extends StatefulWidget {
  @override
  _CustomerViewState createState() => _CustomerViewState();
}

class _CustomerViewState extends State<CustomerView> {
  List<String> listItems = [];
  final TextEditingController textEditingController = TextEditingController();
  CustomerBloc _bloc = CustomerBloc();
  //Customer customer = Customer();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _bloc.changeToUppercase(listItems);
    print('List of customer is $listItems');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Customer Bloc'),
      ),
      body: SafeArea(
        child: Container(
          child: Column(
            children: <Widget>[
              TextField(
                autofocus: true,
                controller: textEditingController,
                onSubmitted: (String text){
                   listItems.add(text);
                   textEditingController.clear();
                   setState(() {

                   });
                },
              ),
              StreamBuilder(
                stream: _bloc.outputStream,
                builder: (BuildContext ctx, AsyncSnapshot snapShot) {
                  if (snapShot.hasData) {
                    return
                      Text(snapShot.data);
//                      Expanded(
//                      child: ListView.builder(
//                        itemCount: snapShot.data.,
//                          itemBuilder: (BuildContext ctx, int index) {
//                          return Text(listItems[index]);    //listItems[index].toUpperCase()
//                          }),
//                    );
                  }
                  if(snapShot.hasError){
                    return Text('Some Error Occurs');
                  }
                  return Text('No Data ');
                },
              ),
//              Expanded(
//                child: ListView.builder(
//                    itemCount: listItems.length,
//                    itemBuilder: (BuildContext ctx, int index) {
//                      return
//                        //Text(_bloc.changeToUppercase(listItems)??' '); //_bloc.changeToUppercase(listItems[index])
//                      ListTile(
//                        leading: Text(_bloc.changeToUppercase(listItems[index])),
//                      );
//                    }),
//              )
            ],
          ),
        ),
      ),
    );
  }
}
