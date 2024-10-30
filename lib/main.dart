import 'package:flutter/material.dart';

void main() => runApp(BinaryToDecimalApp());

class BinaryToDecimalApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Binary to Decimal Converter',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue)
            .copyWith(secondary: Colors.teal),
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
  final _formKey = GlobalKey<FormState>();

  // Function to convert binary to decimal
  void convertBinaryToDecimal() {
    if (binaryInput.isNotEmpty) {
      try {
        int decimalValue = int.parse(binaryInput, radix: 2);
        setState(() {
          decimalOutput = decimalValue.toString();  // Display the decimal value
        });
      } catch (e) {
        setState(() {
          decimalOutput = "";
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Invalid binary input!")),
        );
      }
    } else {
      setState(() {
        decimalOutput = "";
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Please enter a binary number")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Binary to Decimal Converter'),
      ),
      body: Container(
        // Adding Gradient Background
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue.shade200, Colors.blue.shade900],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextField(
                  onChanged: (text) {
                    binaryInput = text;
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Enter Binary Number',
                    hintText: 'E.g., 1010',
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.8), // Semi-transparent background
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.secondary,
                  ),
                  onPressed: convertBinaryToDecimal,
                  child: Text('Convert to Decimal'),
                ),
                SizedBox(height: 20),
                if (decimalOutput.isNotEmpty)
                  Card(
                    color: Colors.blue[50],
                    elevation: 4,
                    margin: EdgeInsets.symmetric(horizontal: 8),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        "Decimal Output: $decimalOutput",
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
