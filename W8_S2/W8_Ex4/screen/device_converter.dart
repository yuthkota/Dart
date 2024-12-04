import 'package:flutter/material.dart';

class DeviceConverter extends StatefulWidget {
  const DeviceConverter({super.key});

  @override
  State<DeviceConverter> createState() => _DeviceConverterState();
}

class _DeviceConverterState extends State<DeviceConverter> {
  final _dollarController = TextEditingController();
  final _rates = {'Euro': 0.93, 'Riels': 4100.0, 'Dong': 23000.0};
  String _selectedDevice = 'Euro';
  double _convertedAmount = 0.0;

  @override
  void dispose() {
    _dollarController.dispose();
    super.dispose();
  }

  void _convert() {
    final amount = double.tryParse(_dollarController.text) ?? 0.0;
    setState(() {
      _convertedAmount = amount * (_rates[_selectedDevice] ?? 1);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Icon(Icons.money, size: 60, color: Colors.white),
          const SizedBox(height: 10),
          const Center(
            child: Text("Convert",
                style: TextStyle(color: Colors.black, fontSize: 20)),
          ),
          const SizedBox(height: 20),
          const Text("Amount in dollars:",
              style: TextStyle(color: Colors.black)),
          TextField(
            controller: _dollarController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              prefix: const Text('\$'),
              hintText: 'Enter amount',
              hintStyle: const TextStyle(color: Colors.black),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.white),
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            style: const TextStyle(color: Colors.white),
            onChanged: (_) => _convert(),
          ),
          const SizedBox(height: 20),
          DropdownButton<String>(
            value: _selectedDevice,
            dropdownColor: Colors.orange[300],
            items: _rates.keys
                .map((device) => DropdownMenuItem(
                      value: device,
                      child: Text(device,
                          style: const TextStyle(color: Colors.white)),
                    ))
                .toList(),
            onChanged: (newValue) => setState(() {
              _selectedDevice = newValue!;
              _convert();
            }),
          ),
          const SizedBox(height: 20),
          const Text("Amount in seleted devide:",
              style: TextStyle(color: Colors.black)),
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              _convertedAmount.toStringAsFixed(2),
              style: const TextStyle(fontSize: 20, color: Colors.black),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
