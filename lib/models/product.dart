class ItemModel {
  static final items = [
    Item(
        color: "#335058",
        id: 1,
        name: "jeans X",
        desc: "MultiBuild functionality jeans",
        image:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRT8BJp76DjX0mgNvIh7PLf1edgt_gZmK6yvF2t3lP7TmFYfLbaccbx3_jBotFzQcyQJAdqFog&usqp=CAc",
        price: 10.5)
  ];
}

class Item {
  final int id;
  final String name;
  final String desc;
  final String color;
  final String image;
  final num price;

  Item({this.id, this.name, this.desc, this.color, this.image, this.price});
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
