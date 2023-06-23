
import 'dart:convert';

CategoryDetailResponce routeModelFromJson(String str) => CategoryDetailResponce.fromJson(json.decode(str));

String routeModelToJson(CategoryDetailResponce data) => json.encode(data.toJson());

class CategoryDetailResponce {
  String? errorCode;
  String? errorMsg;
  List<CategoryDetailData>? data;

  CategoryDetailResponce({this.errorCode, this.errorMsg, this.data});

  CategoryDetailResponce.fromJson(Map<String, dynamic> json) {
    errorCode = json['errorCode'];
    errorMsg = json['errorMsg'];
    if (json['data'] != null) {
      data = <CategoryDetailData>[];
      json['data'].forEach((v) {
        data!.add(new CategoryDetailData.fromJson(v));
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

class CategoryDetailData {
  int? id;
  int? type;
  int? categoryId;
  int? subCatId;
  String? name;
  String? image;
  String? description;
  String? videoUrl;
  String? websiteUrl;
  String? createdAt;
  int? status;

  CategoryDetailData(
      {this.id,
        this.type,
        this.categoryId,
        this.subCatId,
        this.name,
        this.image,
        this.description,
        this.videoUrl,
        this.websiteUrl,
        this.createdAt,
        this.status});

  CategoryDetailData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    categoryId = json['category_id'];
    subCatId = json['sub_cat_id'];
    name = json['name'];
    image = json['image'];
    description = json['description'];
    videoUrl = json['video_url'];
    websiteUrl = json['website_url'];
    createdAt = json['created_at'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['type'] = this.type;
    data['category_id'] = this.categoryId;
    data['sub_cat_id'] = this.subCatId;
    data['name'] = this.name;
    data['image'] = this.image;
    data['description'] = this.description;
    data['video_url'] = this.videoUrl;
    data['website_url'] = this.websiteUrl;
    data['created_at'] = this.createdAt;
    data['status'] = this.status;
    return data;
  }
}