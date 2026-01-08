// import 'dart:async';
//
// import 'package:flutter/material.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:flutter_foreground_task/flutter_foreground_task.dart';
//
// void main() {
//   WidgetsFlutterBinding.ensureInitialized();
//   runApp(const MyApp());
// }
//
// /// ================= BACKGROUND TASK =================
//
// @pragma('vm:entry-point')
// class LocationTaskHandler extends TaskHandler {
//
//   @override
//   Future<void> onStart(DateTime timestamp, TaskStarter starter) async {
//     // No stream here (important)
//   }
//
//   @override
//   Future<void> onRepeatEvent(DateTime timestamp) async {
//     try {
//       final position = await Geolocator.getCurrentPosition(
//         locationSettings: AndroidSettings(
//           accuracy: LocationAccuracy.high,
//         ),
//       );
//
//       final lat = position.latitude.toStringAsFixed(5);
//       final lon = position.longitude.toStringAsFixed(5);
//
//       await FlutterForegroundTask.updateService(
//         notificationText: 'Lat: $lat, Lon: $lon',
//       );
//
//       debugPrint('📍 Background Location: $lat, $lon');
//     } catch (e) {
//       debugPrint('❌ Location error: $e');
//     }
//   }
//
//   @override
//   Future<void> onDestroy(DateTime timestamp, bool isTimeout) async {}
//
//   @override
//   void onNotificationPressed() {}
//
//   @override
//   void onNotificationButtonPressed(String id) {}
// }
//
// @pragma('vm:entry-point')
// void startCallback() {
//   FlutterForegroundTask.setTaskHandler(LocationTaskHandler());
// }
//
// /// ================= UI APP =================
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: HomePage(),
//     );
//   }
// }
//
// class HomePage extends StatefulWidget {
//   const HomePage({super.key});
//
//   @override
//   State<HomePage> createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> {
//   @override
//   void initState() {
//     super.initState();
//     _initForegroundTask();
//     _requestPermissions();
//   }
//
//   /// ---------- Foreground Task Init ----------
//   void _initForegroundTask() {
//     FlutterForegroundTask.init(
//       androidNotificationOptions: AndroidNotificationOptions(
//         channelId: 'location_channel',
//         channelName: 'Location Tracking',
//         channelDescription: 'Background location tracking',
//         channelImportance: NotificationChannelImportance.LOW,
//         priority: NotificationPriority.LOW,
//         showBadge: false,
//         enableVibration: false,
//         playSound: false,
//       ),
//       iosNotificationOptions: const IOSNotificationOptions(),
//       foregroundTaskOptions: ForegroundTaskOptions(
//         eventAction: ForegroundTaskEventAction.repeat(10000), // 10 sec
//         autoRunOnBoot: false,
//         allowWakeLock: true,
//         allowWifiLock: true,
//       ),
//     );
//   }
//
//   /// ---------- Permissions ----------
//   Future<void> _requestPermissions() async {
//     // Location service enabled
//     if (!await Geolocator.isLocationServiceEnabled()) {
//       await Geolocator.openLocationSettings();
//     }
//
//     // Foreground + Background location
//     LocationPermission permission = await Geolocator.checkPermission();
//
//     if (permission == LocationPermission.denied) {
//       permission = await Geolocator.requestPermission();
//     }
//
//     if (permission == LocationPermission.whileInUse) {
//       permission = await Geolocator.requestPermission();
//     }
//
//     if (permission != LocationPermission.always) {
//       await Geolocator.openAppSettings();
//       return;
//     }
//
//     // Battery optimization (mandatory)
//     final isIgnoring =
//     await FlutterForegroundTask.isIgnoringBatteryOptimizations;
//
//     if (!isIgnoring) {
//       await FlutterForegroundTask.requestIgnoreBatteryOptimization();
//     }
//   }
//
//   /// ---------- Start Service ----------
//   Future<void> _startService() async {
//     final isRunning = await FlutterForegroundTask.isRunningService;
//     if (isRunning) return;
//
//     await FlutterForegroundTask.startService(
//       notificationTitle: 'Location Tracking Active',
//       notificationText: 'Fetching location...',
//       callback: startCallback,
//     );
//   }
//
//   /// ---------- Stop Service ----------
//   Future<void> _stopService() async {
//     await FlutterForegroundTask.stopService();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Background Location')),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             ElevatedButton(
//               onPressed: _startService,
//               child: const Text('Start Tracking'),
//             ),
//             const SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: _stopService,
//               child: const Text('Stop Tracking'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
