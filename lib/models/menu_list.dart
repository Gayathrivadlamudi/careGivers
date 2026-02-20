class MenuList {
  final String day;
  final List<Item> data;

  MenuList({
   required this.day,required this.data
  });

    MenuList.fromJson(Map<String,dynamic> json){
     return MenuList(
         day: json['day'],
         data: List<Item>.from())
    }


}