import 'package:flutter/material.dart';

class CurrencyConverter extends StatefulWidget {
  const CurrencyConverter({super.key});

  @override
  State<CurrencyConverter> createState() => _CurrencyConverterState();
}

class _CurrencyConverterState extends State<CurrencyConverter> {
  final TextEditingController _amountController = TextEditingController();
  double _result = 0;
  String _selectedCurrency = 'USD';

  final Map<String, double> _currencyRates = {
    'USD': 85.0,
    'EUR': 95.0,
    'SGD': 60.0,
    'AUD': 55.0,
    'GBP': 100.0,
  };

  void _convertCurrency() {
    final amount = double.tryParse(_amountController.text) ?? 0;
    final rate = _currencyRates[_selectedCurrency] ?? 1;
    setState(() {
      _result = amount * rate;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        title: const Text('Currency Converter',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Enter Amount:',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
            TextField(
              controller: _amountController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                hintText: 'Enter amount',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            const Text('Select Currency:',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            DropdownButton<String>(
              value: _selectedCurrency,
              onChanged: (value) {
                setState(() {
                  _selectedCurrency = value!;
                  _convertCurrency();
                });
              },
              items: _currencyRates.keys.map((currency) {
                return DropdownMenuItem<String>(
                  value: currency,
                  child: Text(currency),
                );
              }).toList(),
            ),
            const SizedBox(height: 16.0),
            const Text('Result:' 'Rate may vary day to day',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
            Text(
              '$_result INR',
              style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _convertCurrency,
              child: const Text('Convert', style: TextStyle(fontSize: 18)),
            ),
          ],
        ),
      ),
    );
  }
}
