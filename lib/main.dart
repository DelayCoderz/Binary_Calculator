import 'package:flutter/material.dart';

void main() => runApp(BinaryToDecimalApp());

class BinaryToDecimalApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Binary to Decimal Converter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BinaryToDecimalConverter(),
    );
  }
}

class BinaryToDecimalConverter extends StatefulWidget {
  @override
  _BinaryToDecimalConverterState createState() => _BinaryToDecimalConverterState();
}

class _BinaryToDecimalConverterState extends State<BinaryToDecimalConverter> {
  String binaryInput = "";  // Input binary number
  String decimalOutput = "";  // Output decimal number

  // Function to convert binary to decimal
  void convertBinaryToDecimal() {
    if (binaryInput.isNotEmpty) {
      try {
        // Convert the binary string to a decimal integer
        int decimalValue = int.parse(binaryInput, radix: 2);
        setState(() {
          decimalOutput = decimalValue.toString();  // Display the decimal value
        });
      } catch (e) {
        setState(() {
          decimalOutput = "Invalid binary input!";
        });
      }
    } else {
      setState(() {
        decimalOutput = "Please enter a binary number";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Binary to Decimal Converter'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            TextField(
              onChanged: (text) {
                binaryInput = text;  // Capture user input
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter Binary Number',
              ),
              keyboardType: TextInputType.number,  // Restrict to number input
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: convertBinaryToDecimal,  // Trigger conversion
              child: Text('Convert to Decimal'),
            ),
            SizedBox(height: 20),
            Text(
              decimalOutput.isNotEmpty ? "Decimal Output: $decimalOutput" : "",
              style: TextStyle(fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
}
