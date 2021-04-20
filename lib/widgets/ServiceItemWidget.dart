import 'package:flutter/material.dart';
import 'package:tmp/models/Service.dart';

class ServiceItemWidget extends StatelessWidget {
  final Service service;
  final Animation animation;
  final VoidCallback onClicked;

  const ServiceItemWidget({
    @required this.service,
    @required this.animation,
    @required this.onClicked,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => SizeTransition(
      sizeFactor: animation,
      child: Container(
        margin: EdgeInsets.all(4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: Colors.black, width: 3),
        ),
        child: ListTile(
          contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          title: Text(service.name + " | " + service.time),
          trailing: IconButton(
            icon: Icon(Icons.remove_circle),
            onPressed: onClicked,
          ),
        ),
      ));
}
