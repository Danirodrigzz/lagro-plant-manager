import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

/// Provider that monitors the real-time network connectivity status.
/// Emits a list of [ConnectivityResult] when the status changes.
final connectivityProvider = StreamProvider<List<ConnectivityResult>>((ref) {
  return Connectivity().onConnectivityChanged;
});

/// Simplified provider that returns true if the user is completely offline.
final isOfflineProvider = Provider<bool>((ref) {
  final connectivity = ref.watch(connectivityProvider).value;
  
  if (connectivity == null) return false;
  
  // Return true ONLY if the list contains only 'none'
  return connectivity.contains(ConnectivityResult.none) && connectivity.length == 1;
});
