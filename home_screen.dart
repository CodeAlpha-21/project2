// home_screen.dart
import 'package:flutter/material.dart';
import 'recipe_list.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Welcome to the Home Screen!'),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Navigate to RecipeList screen
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RecipeList()),
                );
              },
              child: Text('Go to Recipe List'),
            ),
          ],
        ),
      ),
    );
  }
}


