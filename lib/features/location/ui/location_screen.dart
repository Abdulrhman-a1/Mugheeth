import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduation/features/location/logic/get_user_location.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  final LocationHelper locationHelper = LocationHelper();
  Map<String, dynamic>? locationData;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    getLocation();
  }

  Future<void> getLocation() async {
    setState(() => _isLoading = true);
    final data = await locationHelper.getUserLocation();
    setState(() {
      locationData = data;
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('User Location')),
      body: Center(
        child: _isLoading
            ? const CupertinoActivityIndicator()
            : locationData == null
                ? const Text("Location not found")
                : Padding(
                    padding: const EdgeInsets.all(20),
                    child: Card(
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(Icons.location_on,
                                size: 40, color: Colors.red),
                            const SizedBox(height: 12),
                            Text(
                              locationData!['address'],
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w500),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 12),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                    "📍 ${locationData!['latitude'].toStringAsFixed(4)}, "),
                                Text(
                                    "${locationData!['longitude'].toStringAsFixed(4)}"),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Text(
                                "🏙 ${locationData!['city']}, 🌍 ${locationData!['country']}"),
                            const SizedBox(height: 20),
                            ElevatedButton(
                              onPressed: getLocation,
                              child: const Text('Refresh Location'),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
      ),
    );
  }
}
