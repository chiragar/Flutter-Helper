import 'package:flutter/material.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter ListView Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: UserListScreen(),
    );
  }
}

class UserListScreen extends StatelessWidget {
  final List<User> users = getUsers();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User List'),
      ),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          final user = users[index];
          return ListTile(
            leading: Icon(Icons.person),
            title: Text(user.name),
            subtitle: Text('Age: ${user.age}\nEmail: ${user.email}'),
            isThreeLine: true,
          );
        },
        // Optional: Set prototypeItem for consistent item height estimation
        prototypeItem: ListTile(
          leading: Icon(Icons.person),
          title: Text('Prototype'),
          subtitle: Text('Age: 0\nEmail: prototype@example.com'),
          isThreeLine: true,
        ),
      ),
    );
  }
}
List<User> getUsers() {
  return [
    User(name: 'Alice', age: 25, email: 'alice@example.com'),
    User(name: 'Bob', age: 30, email: 'bob@example.com'),
    User(name: 'Charlie', age: 35, email: 'charlie@example.com'),
    // Add more users as needed
  ];
}

class User {
  final String name;
  final int age;
  final String email;

  User({required this.name, required this.age, required this.email});
}