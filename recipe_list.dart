import 'package:flutter/material.dart';
import 'recipe_detail_screen.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class RecipeList extends StatefulWidget {
  @override
  _RecipeListState createState() => _RecipeListState();
}

class _RecipeListState extends State<RecipeList> {
  late Future<List<Map<String, dynamic>>> _futureRecipes;

  @override
  void initState() {
    super.initState();
    _futureRecipes = fetchRecipes();
  }

  Future<List<Map<String, dynamic>>> fetchRecipes() async {
    final response = await http.get(Uri.parse('https://abdallahshamas.000webhostapp.com/test/view.php'));

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      List<Map<String, dynamic>> recipes = data.cast<Map<String, dynamic>>();
      return recipes;
    } else {
      throw Exception('Failed to fetch recipes. Status code: ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _futureRecipes,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else {
          List<Map<String, dynamic>> recipes = snapshot.data as List<Map<String, dynamic>>;
          return _buildRecipeList(recipes);
        }
      },
    );
  }

  Widget _buildRecipeList(List<Map<String, dynamic>> recipes) {
    return ListView.builder(
      itemCount: recipes.length,
      itemBuilder: (context, index) {
        return Card(
          elevation: 4.0,
          margin: EdgeInsets.symmetric(vertical: 8.0),
          child: ListTile(
            title: Text(
              recipes[index]['name'],
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => RecipeDetailScreen(recipe: recipes[index]),
                ),
              );
            },
          ),
        );
      },
    );
  }
}