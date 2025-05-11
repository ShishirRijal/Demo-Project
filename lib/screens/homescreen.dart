import 'package:demo_app/Screens/input_screen.dart';
import 'package:flutter/material.dart';
import '../../services/local_storage_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? _userName;
  int _counter = 0;

  @override
  void initState() {
    super.initState();
    // LocalStorageService.clearData();
    _loadData();
  }

  Future<void> _loadData() async {
    _userName = await LocalStorageService.getName();
    _counter = await LocalStorageService.getCounter();

    setState(() {});
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
    LocalStorageService.saveCounter(_counter);
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
    });
    LocalStorageService.saveCounter(_counter);
  }

  Future<void> _navigateToNameInput() async {
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => InputScreen()),
    );
    _loadData();
  }

  @override
  Widget build(BuildContext context) {
    bool buttonsEnabled = _userName != null && _userName!.isNotEmpty;

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Hi, ',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
                ),

                GestureDetector(
                  onTap: _navigateToNameInput,
                  child: Text(
                    _userName ?? '_ _ _ _ _ _',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),

            SizedBox(height: 20),
            Text('Your count is:', style: TextStyle(fontSize: 20)),
            SizedBox(height: 10),
            Text(
              '$_counter',
              style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // decrement
                CustomButton(
                  Icons.remove,
                  onPressed: buttonsEnabled ? _decrementCounter : null,
                ),

                SizedBox(width: 20),

                // increment
                CustomButton(
                  Icons.add,
                  onPressed: buttonsEnabled ? _incrementCounter : null,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton(this.icon, {this.onPressed, super.key});

  final IconData icon;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
        shape: CircleBorder(),
        shadowColor: Colors.black26,
        elevation: 8,

        backgroundColor: Colors.black,
        disabledBackgroundColor: Colors.black45,
        textStyle: TextStyle(fontSize: 24),
      ),
      child: Icon(icon, size: 30, color: Colors.white),
    );
  }
}
