class MenuList {
  final String day;
  final List<Item> data;

  MenuList({
   required this.day,required this.data
  });

    factory MenuList.fromJson(Map<String,dynamic> json){
     return MenuList(
         day: json['day'],
         data: List<Item>.from(
             json['data'].map((data)=>Item.fromJson(data)),
         ));
    }
}
    class Item{
      final String img;
      final String foodTitle;
      final String desc;
      final int price;
       String color;
       final int i;
       final int j;
      Item({
        required this.img, required this.foodTitle,required this.desc,required this.price,required this.color, required this.i, required this.j
    });
        factory Item.fromJson(Map<String,dynamic> json){
          return Item(
            img: json['img'],
            foodTitle: json['itemTitle'],
            desc:json['desc'],
            price: json['price'],
            color:json['color'],
              i: json['i'],
              j: json['j'],
          );
        }
      }



