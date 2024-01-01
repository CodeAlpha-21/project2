import 'package:flutter/material.dart';

class RecipeDetailScreen extends StatelessWidget {
  final Map<String, dynamic> recipe;

  RecipeDetailScreen({required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(recipe['name']),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.network(
              recipe['imageUrl'],
              height: 200.0,
              errorBuilder: (BuildContext context, Object error, StackTrace? stackTrace) {
                return Text('Image failed to load');
              },
            ),
            SizedBox(height: 16.0),
            Text(
              recipe['description'],
              style: TextStyle(fontSize: 16.0),
            ),
          ],
        ),
      ),
    );
  }
}