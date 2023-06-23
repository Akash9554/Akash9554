

import 'dart:convert';

CategoryListResponce routeModelFromJson(String str) => CategoryListResponce.fromJson(json.decode(str));

String routeModelToJson(CategoryListResponce data) => json.encode(data.toJson());

class CategoryListResponce {



  String? errorCode;
  String? errorMsg;
  List<CategoryListData>? data;

  CategoryListResponce({this.errorCode, this.errorMsg, this.data});

  CategoryListResponce.fromJson(Map<String, dynamic> json) {
    errorCode = json['errorCode'];
    errorMsg = json['errorMsg'];
    if (json['data'] != null) {
      data = <CategoryListData>[];
      json['data'].forEach((v) {
        data!.add(new CategoryListData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['errorCode'] = this.errorCode;
    data['errorMsg'] = this.errorMsg;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CategoryListData {
  int? id;
  String? name;
  Null? image;
  String? websiteUrl;
  String? createdAt;
  int? status;
  List<SubCategory>? subCategory;

  CategoryListData(
      {this.id,
        this.name,
        this.image,
        this.websiteUrl,
        this.createdAt,
        this.status,
        this.subCategory});

  CategoryListData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    websiteUrl = json['website_url'];
    createdAt = json['created_at'];
    status = json['status'];
    if (json['subCategory'] != null) {
      subCategory = <SubCategory>[];
      json['subCategory'].forEach((v) {
        subCategory!.add(new SubCategory.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['image'] = this.image;
    data['website_url'] = this.websiteUrl;
    data['created_at'] = this.createdAt;
    data['status'] = this.status;
    if (this.subCategory != null) {
      data['subCategory'] = this.subCategory!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SubCategory {
  int? id;
  int? catId;
  String? name;
  Null? image;
  String? createdAt;
  int? status;

  SubCategory(
      {this.id,
        this.catId,
        this.name,
        this.image,
        this.createdAt,
        this.status});

  SubCategory.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    catId = json['cat_id'];
    name = json['name'];
    image = json['image'];
    createdAt = json['created_at'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['cat_id'] = this.catId;
    data['name'] = this.name;
    data['image'] = this.image;
    data['created_at'] = this.createdAt;
    data['status'] = this.status;
    return data;
  }
}