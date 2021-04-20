import 'package:flutter/material.dart';
import 'package:tmp/models/Service.dart';
import 'package:tmp/pages/AddEventPage.dart';
import 'package:tmp/widgets/ServiceItemWidget.dart';

import 'SideMenu.dart';

import 'package:tmp/models/ServicesLib.dart' as services;

class MainPage extends StatefulWidget {
  MainPage({Key key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  /*
  IconButton addButton = IconButton(
      icon: const Icon(Icons.add_circle),
      onPressed: () => insertItem(1, services.testServices[0]));*/
  final key = GlobalKey<AnimatedListState>();
  final items = List.from(services.testServices);
  Service newService;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: NavDrawer(),
        appBar: AppBar(
          title: Text('Welcome'),
          actions: <Widget>[
            IconButton(
                icon: const Icon(Icons.add_circle), onPressed: onAddButtonClick)
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: AnimatedList(
                key: key,
                initialItemCount: items.length,
                itemBuilder: (context, index, animation) =>
                    buildItem(items[index], index, animation),
              ),
            ),
            /*
                                Container(
                                  padding: EdgeInsets.all(10),
                                  child: addButton,//buildInsertButton(),
                                )*/
          ],
        ));
  }

  Widget buildItem(item, int index, Animation<double> animation) =>
      ServiceItemWidget(
        service: item,
        animation: animation,
        onClicked: () => removeItem(
          index,
        ),
      );

  void removeItem(int index) {
    final item = items.removeAt(index);
    key.currentState.removeItem(
        index, (context, animation) => buildItem(item, index, animation));
  }

  void insertItem(int index, Service item) {
    items.insert(index, item);
    key.currentState.insertItem(index);
  }

  void onAddButtonClick() async {
    newService = await Navigator.push(
        context, MaterialPageRoute(builder: (context) => AddEventPage()));
    if (newService != null) {
      await Future.delayed(Duration(seconds: 1));
      insertItem(0, newService);
    }
  }

/*
  Widget buildInsertButton() => RaisedButton(
        child: Text('Add service'),
        onPressed: () {},
      );
      */
}

/*

ListView.builder(
          itemCount: services.testServices.length,
          itemBuilder: (context, index) {
            return Center(
              child: Card(
                elevation: 2.0,
                margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                child: Container(
                  child: ListTile(
                    title: Text(services.testServices[index].name),
                  ),
                ),
              ),
            );
          },
        ))
 */

/*

Center(
            child: AnimatedList(
                initialItemCount: services.testServices.length,
                itemBuilder: (context, index, animation) {
                  return SlideTransition(
                    position: animation.drive(AlignmentTween(
                      begin: Alignment.topLeft,
                      end: Alignment.topRight,
                    )),
                    child: Card(
                      elevation: 2.0,
                      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      child: Container(
                        child: ListTile(
                          title: Text(services.testServices[index].name),
                        ),
                      ),
                    ),
                  );
                }))

*/
