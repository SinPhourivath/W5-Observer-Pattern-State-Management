import 'dart:io';

import 'package:week5/EXERCISE-1/models/location.dart';
import 'package:week5/EXERCISE-1/models/ride_preference.dart';
import 'package:week5/EXERCISE-1/ride_preferences_listener.dart';
import 'package:week5/EXERCISE-1/services/ride_preference_service.dart';

void main() {
  // Create instance of service and observer
  RidePreferenceService ridePreferenceService = RidePreferenceService();
  ConsoleLogger consoleLogger = ConsoleLogger();

  // Register observer
  ridePreferenceService.addListener(consoleLogger);

  // Select ride preference
  RidePreference selectedRidePreference = RidePreference(
    departure: Location(name: "Phnom Penh", country: Country.cambodia),
    departureDate: DateTime(2025, 4, 15, 10),
    arrival: Location(name: "Pursat", country: Country.cambodia),
    requestedSeats: 1,
  );

  ridePreferenceService.setRidePreference(selectedRidePreference);

  // Another observer just to make sure everything work
  ConsoleLogger newConsoleLogger = ConsoleLogger();
  ridePreferenceService.addListener(newConsoleLogger);

  // Just simulating the real scenario
  sleep(Duration(seconds: 3));

  // Update ride preference
  selectedRidePreference = RidePreference(
    departure: Location(name: "Phnom Penh", country: Country.cambodia),
    departureDate: DateTime(2025, 4, 15, 10),
    arrival: Location(name: "Siem Reap", country: Country.cambodia),
    requestedSeats: 2,
  );

  ridePreferenceService.setRidePreference(selectedRidePreference);
}
