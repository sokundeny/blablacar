import 'package:blabla/model/ride/locations.dart';
import 'package:blabla/ui/theme/theme.dart';
import 'package:flutter/material.dart';


class LocationListile extends StatelessWidget {
  final Location loc;
  const LocationListile({super.key,required this.loc});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(
          color: BlaColors.greyLight
        ))
      ),
      child: ListTile(
        title: Text(loc.name),
        subtitle: Text(loc.country.name),
        trailing: Icon(
          Icons.keyboard_arrow_right_outlined,
          color: BlaColors.greyLight,
        ),
        onTap: () {
          Navigator.pop<Location>(context, loc);
        },
      )
    );
  }
}
