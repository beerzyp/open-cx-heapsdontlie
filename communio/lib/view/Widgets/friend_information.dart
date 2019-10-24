import 'package:flutter/material.dart';
import 'package:communio/view/theme.dart' show accentColor;

class FriendInformation extends StatelessWidget {
  final String name;
  final String location;

  FriendInformation({@required this.name, @required this.location});

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            name,
            style: Theme.of(context).textTheme.caption,
          ),
          generateFriendLocation(context, location),
        ]);
  }

  Widget generateFriendLocation(BuildContext context, String location) {
    return Row(children: <Widget>[
      Icon(
        Icons.location_on,
        color: accentColor,
        size: 17,
        // will be color of the theme
      ),
      Padding(
          padding: const EdgeInsets.only(left: 2.0),
          child: Text(
            location,
            style: Theme.of(context).textTheme.caption.apply(fontSizeDelta: -5),
            )
          )
    ]);
  }
}
