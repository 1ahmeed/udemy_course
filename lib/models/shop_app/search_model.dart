
class SearchModel {
  bool ?status;
  Data? data;

  SearchModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data =(json['data'] != null ? Data.fromJson(json['data']) : null)!;
  }
}

class Data {
   int? currentPage;
   List<Product> data=[];
   String?  firstPageUrl;
   int? from;
   int? lastPage;
   String? lastPageUrl;
   String? path;
   int? perPage;
   int? to;
   int? total;

  Data.fromJson(Map<String, dynamic> json) {
    currentPage=json['currentPage'];
    if(json['data']!=null) {
      data=[];
      json['data'].forEach((v) {
      data.add( Product.fromJson(v));
    });
    }
    currentPage = json['current_page'];
    firstPageUrl = json['first_page_url'];
    from = json['from'];
    lastPage = json['last_page'];
    lastPageUrl = json['last_page_url'];
    path = json['path'];
    perPage = json['per_page'];
    to = json['to'];
    total = json['total'];
  }

}


class Product {
  late int id;
  late dynamic price;
  late dynamic oldPrice;
  late int discount;
  late String image;
  late String name;
  late String description;

  Product({
    required this.id,
    required this.price,
    required this.oldPrice,
    required this.discount,
    required this.image,
    required this.name,
    required this.description});



  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    price = json['price'];
    oldPrice = json['old_price'];
    discount = json['discount'];
    image = json['image'];
    name = json['name'];
    description = json['description'];
  }

}




// class SearchModel {
//   late bool? status;
//   late Null? message;
//  late Data? data;
//
//
//   SearchModel.fromJson(Map<String, dynamic> json) {
//     status = json['status'];
//     message = json['message'];
//     data = json['data'] != null ? new Data.fromJson(json['data']) : null;
//   }
//
// }
//
// class Data {
//   late int? currentPage;
//   late List<Product>? data;
//   late String? firstPageUrl;
//   late int? from;
//   late int? lastPage;
//   late String? lastPageUrl;
//   late Null? nextPageUrl;
//   late String? path;
//   late int? perPage;
//   late  Null? prevPageUrl;
//   late int? to;
//   late int? total;
//
//
//
//   Data.fromJson(Map<String, dynamic> json) {
//     currentPage = json['current_page'];
//     if (json['data'] != null) {
//       data = <Product>[];
//       json['data'].forEach((v) {
//         data!.add(new Product.fromJson(v));
//       });
//     }
//     firstPageUrl = json['first_page_url'];
//     from = json['from'];
//     lastPage = json['last_page'];
//     lastPageUrl = json['last_page_url'];
//     nextPageUrl = json['next_page_url'];
//     path = json['path'];
//     perPage = json['per_page'];
//     prevPageUrl = json['prev_page_url'];
//     to = json['to'];
//     total = json['total'];
//   }
//
//
// }
//
// class Product {
//   late  int? id;
//   dynamic price;
//   dynamic oldPrice;
//   late int? discount;
//   late String? image;
//   late String? name;
//   late String? description;
//
//   Product(
//       {this.id,
//         this.price,
//         this.oldPrice,
//         this.discount,
//         this.image,
//         this.name,
//         this.description});
//
//   Product.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     price = json['price'];
//     oldPrice = json['old_price'];
//     discount = json['discount'];
//     image = json['image'];
//     name = json['name'];
//     description = json['description'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['price'] = this.price;
//     data['old_price'] = this.oldPrice;
//     data['discount'] = this.discount;
//     data['image'] = this.image;
//     data['name'] = this.name;
//     data['description'] = this.description;
//     return data;
//   }
// }
