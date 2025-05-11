import 'package:flutter/material.dart';
import '../../services/local_storage_service.dart';

class InputScreen extends StatefulWidget {
  const InputScreen({super.key});

  @override
  State<InputScreen> createState() => InputScreenState();
}

class InputScreenState extends State<InputScreen> {
  final TextEditingController _nameController = TextEditingController();
  bool _isSaveButtonEnabled = false;

  @override
  void initState() {
    super.initState();
    _nameController.addListener(_updateSaveButtonState);
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  void _updateSaveButtonState() {
    setState(() {
      _isSaveButtonEnabled = _nameController.text.isNotEmpty;
    });
  }

  Future<void> _saveName() async {
    if (_nameController.text.isNotEmpty) {
      await LocalStorageService.saveName(_nameController.text);
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Back Button
              Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                  icon: Icon(Icons.arrow_back, color: Colors.black),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),

              Spacer(),

              // Inputs
              TextField(
                controller: _nameController,
                style: TextStyle(color: Colors.black, fontSize: 18),
                decoration: InputDecoration(
                  labelText: 'Enter your name',
                  border: OutlineInputBorder(),
                  labelStyle: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 2.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 2.0),
                  ),
                ),
              ),
              SizedBox(height: 30),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _isSaveButtonEnabled ? _saveName : null,
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    backgroundColor: Colors.black,
                    disabledBackgroundColor: Colors.black45,
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                    textStyle: TextStyle(fontSize: 18),
                  ),
                  child: Text(
                    'Submit',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),

              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
