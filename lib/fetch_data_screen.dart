import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:node_tutorial/model/product_model.dart';
import 'package:node_tutorial/services/api.dart';

class FetchScreen extends StatefulWidget {
  const FetchScreen({super.key});

  @override
  State<FetchScreen> createState() => _FetchScreenState();
}

class _FetchScreenState extends State<FetchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(
          future: Api.getProduct(),
          builder: (BuildContext context, AsyncSnapshot snapshot){
            if(!snapshot.hasData){
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else{
              List<Product> pData = snapshot.data;
             return ListView.builder(
                itemCount: pData.length,
                  itemBuilder: (BuildContext context,int index){
                  return Container(
                    padding: EdgeInsets.only(top: 3),
                    margin: EdgeInsets.only(top: 3),
                    color: Colors.red,
                    child: ListTile(
                      leading: const Icon(Icons.storage),
                      title: Text("${pData[index].name}"),
                      subtitle: Text("${pData[index].desc}"),
                      trailing: Text("${pData[index].price}"),
                    ),
                  );
                  }
              );
            }
          }
      ),
    );
  }
}


//more error handler code.

/*
import 'package:flutter/material.dart';
import 'package:node_tutorial/model/product_model.dart';
import 'package:node_tutorial/services/api.dart';

class FetchScreen extends StatefulWidget {
  const FetchScreen({super.key});

  @override
  State<FetchScreen> createState() => _FetchScreenState();
}

class _FetchScreenState extends State<FetchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(
        future: Api.getProduct(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          // Checking the state of the Future
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            // Print error to console if the API call fails
            print("Error: ${snapshot.error}");
            return Center(
              child: Text('Error fetching data'),
            );
          } else if (!snapshot.hasData || snapshot.data.isEmpty) {
            return const Center(
              child: Text('No data available'),
            );
          } else {
            List<Product> pData = snapshot.data;

            // Debug print to verify the data received
            print("Data fetched: $pData");

            return Expanded(
              child: ListView.builder(
                itemCount: pData.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    color: Colors.red,
                    child: ListTile(
                      leading: const Icon(Icons.storage),
                      // title: Text(pData[index].name),
                      // subtitle: Text(pData[index].desc),
                      trailing: Text("\$${pData[index].price}"),
                    ),
                  );
                },
              ),
            );
          }
        },
      ),
    );
  }
}
*/