import 'package:flutter/material.dart';
import 'package:ojoregedapp/presentation/Home/provider/dashboard_provider.dart';
import 'package:provider/provider.dart';

class SizeSelectionCard extends StatelessWidget {
  final List<String> sizes = ['XS', 'S', 'M', 'L', 'XL'];

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: sizes
                .map((size) => _buildSizeCard(context, size))
                .toList(),
          ),
        ),
    );
  }

  Widget _buildSizeCard(BuildContext context, String size) {
    final selectedSize = Provider.of<DashboardProvider>(context).selectedSize;
    final isSelected = size == selectedSize;

    // Map of size information
    final Map<String, String> sizeInfo = {
      'XS': 'Extra Small',
      'S': 'Small',
      'M': 'Medium',
      'L': 'Large',
      'XL': 'Extra Large',
    };

    return Container(
      width: 200, // Adjust width as needed
      height: 140, // Adjust height as needed
      child: Card(
        color: isSelected ? Color.fromRGBO(255, 152, 0, 1) : Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                size,
                style: TextStyle(
                  color: isSelected ? Colors.white : Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Text(
                sizeInfo[size] ?? '', // Use size information from the map
                style: TextStyle(
                  color: isSelected ? Colors.white : Colors.black,
                  fontSize: 14,
                ),
              ),
              SizedBox(height: 8),
              ElevatedButton(
                onPressed: () {
                  Provider.of<DashboardProvider>(context, listen: false).setSelectedSize(size);
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.transparent),
                  elevation: MaterialStateProperty.all(0), // Remove elevation for transparent background
                  padding: MaterialStateProperty.all(EdgeInsets.zero), // Remove padding for transparent background
                ),
                child: Text(
                  'Select',
                  style: TextStyle(
                    color: isSelected ? Colors.white : Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
