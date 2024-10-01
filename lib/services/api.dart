import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:node_tutorial/model/product_model.dart';

class Api {
  static const baseUrl = "http://192.168.248.55:2000/api/";
  // 'http://10.0.2.2:3000/your-endpoint';

  //post method
  static addProduct(Map pData) async {
    print(pData);
    var url = Uri.parse("${baseUrl}add_product");
    try {
      final res = await http.post(url, body: pData);

      if (res.statusCode == 200) {
        var data = jsonDecode(res.body.toString());
        print(data);
        //
      } else {
        print("Failed to load get the add_product response");
        //
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  //get method
  static getProduct() async {
    List<Product> products = [];
    var url = Uri.parse("${baseUrl}get_product");
    try {
      var res = await http.get(url);

      if (res.statusCode == 200) {
        var data = jsonDecode(res.body.toString());
        print("get data $data");
        data['products'].forEach((value) {
          products.add(
              Product(
              name: value['pname'],
                  desc: value['pdesc'],
                  price: value['pprice'],
                id: value['id'].toString(),

              ));
        });
        return products;
      } else {
        return [];
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  //update api
  static updateProduct(id, body) async {
    var url = Uri.parse("${baseUrl}update/$id");
    try {
      var res = await http.put(url,body: body);
      if (res.statusCode == 200) {
        var data = jsonDecode(res.body);
        print("update data $data");
      } else {
        print("failed to update data");
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  //delete method

  static deleteProduct(id) async {
    var url = Uri.parse("${baseUrl}delete/$id");
    final res = await http.post(url);
    // 204 means no content, so no need to parse the body
    if (res.statusCode == 204) {
      print("Product deleted successfully.");
    } else {
      // In case of failure, you can still print the body for debugging purposes
      print('Failed to delete product: ${res.statusCode}');
      print('Response: ${res.body}');
    }
  }
}
