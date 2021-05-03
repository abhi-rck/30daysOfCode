import 'dart:convert';

class ItemModel {
  static List<Item> items = [];

  static Item getById(int id) {
    return items.firstWhere((element) => element.id == id, orElse: null);
  }

  static Item getByPosition(int pos) {
    return items[pos];
  }
}

class Item {
  final int id;
  final String name;
  final String desc;
  final String color;
  final String image;
  final num price;

  Item({
    this.id,
    this.name,
    this.desc,
    this.color,
    this.image,
    this.price,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'desc': desc,
      'color': color,
      'image': image,
      'price': price,
    };
  }

  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
      id: map['id'],
      name: map['name'],
      desc: map['desc'],
      color: map['color'],
      image: map['image'],
      price: map['price'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Item.fromJson(String source) => Item.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Item(id: $id, name: $name, desc: $desc, color: $color, image: $image, price: $price)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Item &&
        other.id == id &&
        other.name == name &&
        other.desc == desc &&
        other.color == color &&
        other.image == image &&
        other.price == price;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        desc.hashCode ^
        color.hashCode ^
        image.hashCode ^
        price.hashCode;
  }
}

final products = [
  Item(
      color: "#335058",
      id: 1,
      name: "jeans X",
      desc: "MultiBuild functionality jeans",
      image:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRT8BJp76DjX0mgNvIh7PLf1edgt_gZmK6yvF2t3lP7TmFYfLbaccbx3_jBotFzQcyQJAdqFog&usqp=CAc",
      price: 10.5)
];
