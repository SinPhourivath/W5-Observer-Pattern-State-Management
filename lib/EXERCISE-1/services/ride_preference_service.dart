import 'package:week5/EXERCISE-1/models/ride_preference.dart';
import 'package:week5/EXERCISE-1/ride_preferences_listener.dart';

class RidePreferenceService {
  RidePreference? _ridePreference;
  final List<RidePreferencesListener> _listeners = [];

  void addListener(RidePreferencesListener ridePreferencesListener) {
    _listeners.add(ridePreferencesListener);
  }

  void setRidePreference(RidePreference newRidePreference) {
    _ridePreference = newRidePreference;
    _notifyListeners();
  }

  void _notifyListeners() {
    for (var listener in _listeners) {
      listener.onPreferenceSelected(_ridePreference!);
    }
  }
}
