import 'package:blabla/ui/widgets/actions/location_listile.dart';
import 'package:flutter/material.dart';
import '../../../../model/ride/locations.dart';
import '../../theme/theme.dart';
import '../../../dummy_data/dummy_data.dart';

class LocationPickerScreen extends StatefulWidget {
  final Location selectedLocation;

  const LocationPickerScreen({super.key, required this.selectedLocation});

  @override
  State<LocationPickerScreen> createState() => _LocationPickerScreenState();
}

class _LocationPickerScreenState extends State<LocationPickerScreen> {
  String filter = '';
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller.text = widget.selectedLocation.name;
    setState(() {
      filter = _controller.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    final filteredLocations = fakeLocations
        .where(
          (loc) =>
              loc.name.toLowerCase().contains(filter.toLowerCase()) ||
              loc.country.name.toLowerCase().contains(filter.toLowerCase()),
        )
        .toList();

    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                filled: true,
                fillColor: BlaColors.greyLight,
                hintText: 'Search city',
                prefixIcon: IconButton(
                  onPressed: () {
                    Navigator.pop<Location>(context, widget.selectedLocation);
                  },
                  icon: Icon(Icons.arrow_back),
                ),
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      filter = '';
                      _controller.text = "";
                    });
                  },
                  icon: Icon(Icons.clear),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none
                ),
              ),
              onChanged: (value) {
                setState(() {
                  filter = value;
                });
              },
            ),
          ),

          // Locations list
          if (filter != "")
            Expanded(
              child: ListView.builder(
                itemCount: filteredLocations.length,
                itemBuilder: (context, index) {
                  final loc = filteredLocations[index];
                  return LocationListile(loc: loc);
                },
              ),
            ),
        ],
      ),
    );
  }
}
