import 'package:simple_shopping/models/product/product.dart';

class CartProduct {
  Product item;
  int cantidad;
  CartProduct({required this.item,required this.cantidad});


  void increaseCount(){
    cantidad++;
  }

  void decreaseCount(){
    cantidad--;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! CartProduct) return false;
    return item == other.item ;
  }

  @override
  int get hashCode => item.hashCode;

}