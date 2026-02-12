import 'package:flutter/material.dart';

import '../../../../model/ride/locations.dart';
import '../../../../model/ride_pref/ride_pref.dart';
import './ridepref_field.dart';
import '../../../theme/theme.dart';
import '../../../widgets/actions/bla_button.dart';

///
/// A Ride Preference From is a view to select:
///   - A depcarture location
///   - An arrival location
///   - A date
///   - A number of seats
///
/// The form can be created with an existing RidePref (optional).
///
class RidePrefForm extends StatefulWidget {
  // The form can be created with an optional initial RidePref.
  final RidePref initRidePref;
  final void Function(RidePref)? onSubmit;

  const RidePrefForm({super.key, required this.initRidePref, this.onSubmit});

  @override
  State<RidePrefForm> createState() => _RidePrefFormState();
}

class _RidePrefFormState extends State<RidePrefForm> {
  late Location departure;
  late DateTime departureDate;
  late Location arrival;
  late int requestedSeats;

  // ----------------------------------
  // Initialize the Form attributes
  // ----------------------------------

  @override
  void initState() {
    super.initState();
    // TODO
    departure = widget.initRidePref.departure;
    arrival = widget.initRidePref.arrival;
    departureDate = widget.initRidePref.departureDate;
    requestedSeats = widget.initRidePref.requestedSeats;
  }

  // ----------------------------------
  // Handle events
  // ----------------------------------
  bool get _isValid => departure.name.isNotEmpty && arrival.name.isNotEmpty;

  void _switchLocations() {
    setState(() {
      final tmp = departure;
      departure = arrival;
      arrival = tmp;
    });
  }

  // ----------------------------------
  // Compute the widgets rendering
  // ----------------------------------
  void _submit() {
    if (!_isValid) return;

    final ridePref = RidePref(
      departure: departure,
      arrival: arrival,
      departureDate: departureDate,
      requestedSeats: requestedSeats,
    );

    widget.onSubmit?.call(ridePref);
  }

  // ----------------------------------
  // Build the widgets
  // ----------------------------------
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        RideprefField(
          icon: Icons.circle_outlined,
          label: departure.name.isEmpty
              ? 'Departure'
              : "${departure.name}, ${departure.country}",
          onTap: () => {},
          trailing: IconButton(
            icon: const Icon(Icons.swap_vert),
            onPressed: _switchLocations,
          ),
        ),

        RideprefField(
          icon: Icons.circle_outlined,
          label: arrival.name.isEmpty 
              ? 'Destination' 
              : "${arrival.name}, ${arrival.country}",
          onTap: () {},
        ),

        RideprefField(
          icon: Icons.calendar_month,
          label:
              '${departureDate.day}/${departureDate.month}/${departureDate.year}',
          onTap: () {},
        ),

        RideprefField(
          icon: Icons.person,
          label: '$requestedSeats passenger${requestedSeats > 1 ? 's' : ''}',
          onTap: () => {},
        ),

        const SizedBox(height: BlaSpacings.l),

        SizedBox(
          width: double.infinity,
          child: BlaButton(
            text: 'Search',
            isPrimary: true,
            onPressed: _isValid ? _submit : () {},
          ),
        ),
      ],
    );
  }
}
