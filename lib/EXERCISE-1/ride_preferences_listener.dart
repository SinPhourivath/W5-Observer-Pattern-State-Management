import 'package:week5/EXERCISE-1/models/ride_preference.dart';

abstract class RidePreferencesListener {
  void onPreferenceSelected(RidePreference ridePreference);
}

class ConsoleLogger implements RidePreferencesListener {
  @override
  void onPreferenceSelected(RidePreference ridePreference) {
    print("Logger: Ride preference updated to $ridePreference\n");
  }
}
