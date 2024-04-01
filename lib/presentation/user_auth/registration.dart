import 'package:flutter/material.dart';

class Register extends StatelessWidget {
  Register({Key? key}) : super(key: key);

  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _middleNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _telephoneController = TextEditingController();
  final TextEditingController _emailAddressController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: Text('Registration'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Create an Account',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            _buildTextField(
              controller: _firstNameController,
              labelText: 'First Name',
              icon: Icons.person,
            ),
            SizedBox(height: 10),
            _buildTextField(
              controller: _middleNameController,
              labelText: 'Middle Name',
              icon: Icons.person,
            ),
            SizedBox(height: 10),
            _buildTextField(
              controller: _lastNameController,
              labelText: 'Last Name',
              icon: Icons.person,
            ),
            SizedBox(height: 10),
            _buildTextField(
              controller: _telephoneController,
              labelText: 'Telephone',
              icon: Icons.phone,
              keyboardType: TextInputType.phone,
            ),
            SizedBox(height: 10),
            _buildTextField(
              controller: _emailAddressController,
              labelText: 'Email Address',
              icon: Icons.email,
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(height: 10),
            _buildTextField(
              controller: _usernameController,
              labelText: 'Username',
              icon: Icons.account_circle,
            ),
            SizedBox(height: 10),
            _buildTextField(
              controller: _passwordController,
              labelText: 'Password',
              icon: Icons.lock,
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Perform registration logic
                // You can access the text from the controllers like _firstNameController.text
              },
              child: Text('Create Account'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String labelText,
    required IconData icon,
    TextInputType? keyboardType,
    bool obscureText = false,
  }) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        prefixIcon: Icon(icon),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      keyboardType: keyboardType,
      obscureText: obscureText,
    );
  }
}
