// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);


import 'dart:convert';

Welcome categoryModelFromJson(String str) => Welcome.fromJson(json.decode(str));


class Welcome {
    Welcome({
        required this.categories,
    });

    List<Category> categories;

    factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
        categories: List<Category>.from(json["categories"].map((x) => Category.fromJson(x))),
    );

   
}

class Category {
    Category({
        required this.name,
        required this.subcategory,
    });

    String name;
    List<String> subcategory;

    factory Category.fromJson(Map<String, dynamic> json) => Category(
        name: json["name"],
        subcategory: List<String>.from(json["subcategory"].map((x) => x)),
    );

    
}
