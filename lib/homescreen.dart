import 'package:flutter/material.dart';
import 'package:new_list_api2/api.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ok'),
      ),
      body: Column(
        children: [
          FutureBuilder(
              future: getApidata(),
              builder: (context, index) {
                if (index.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (index.hasError) {
                  return Text('${index.error}');
                } else if (index.hasData) {
                  final data = index.data!;
                  return Expanded(
                      child: ListView.builder(
                          itemCount: data.length,
                          itemBuilder: (context, indexs) {
                            return Card(
                              child: ListTile(
                                leading: Text('ID:${data[indexs].id}'),
                                title: Text('Name:${data[indexs].name}'),
                                subtitle: Text('Email:${data[indexs].email}'),
                                trailing: Text('Post:${data[indexs].postId}'),
                              ),
                            );
                          }));
                } else {
                  return Text('unable to fetch the data');
                }
              })
        ],
      ),
    );
  }
}
