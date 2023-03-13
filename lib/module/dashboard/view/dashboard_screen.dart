import 'package:flutter/material.dart';

import '../../../shared/utils/constants.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.menu,
          ),
        ),
        title: Image.asset(
          xxiLogo,
          fit: BoxFit.cover,
          height: MediaQuery.of(context).size.height / 7,
        ),
        centerTitle: true,
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.refresh))],
      ),
      body: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                flex: 1,
                child: Container(
                  color: Colors.amber,
                  child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.location_on,
                      ),
                      Text("JAKARTA"),
                      Icon(
                        Icons.keyboard_arrow_down_outlined,
                      ),
                    ],
                  ),
                ),
              ),
              Flexible(
                flex: 2,
                child: Container(
                  color: Colors.red,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Flexible(
                        child: ListTile(
                          minLeadingWidth: 1,
                          leading: Icon(Icons.forward_to_inbox),
                          title: Text("Inbox"),
                        ),
                      ),
                      Flexible(
                        child: ListTile(
                          minLeadingWidth: 1,
                          leading: Icon(Icons.topic),
                          title: Text("Inbox"),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
