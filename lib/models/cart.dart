import 'package:app1/models/catalog.dart';

class CartModel {
  static final cartModel = CartModel._internal();

  CartModel._internal();
  
  factory CartModel() => cartModel;

  //catalog field
  CatalogModel _catalog;

  //collection of item's ids
  final List<int> _itemsIds = [];

  //get catalog
  CatalogModel get catalog => _catalog;

  //set catalog
  set catalog(CatalogModel newCatalog) {
    assert(newCatalog != null);
    _catalog = newCatalog;
  }

  //get items in the cart
  List<Item> get items =>
      _itemsIds.map((id) => _catalog.getItembyId(id)).toList();

  //get total price
  num get totalPrice =>
      items.fold(0, (total, current) => total + current.price);

  //add item
  void add(Item item) {
    _itemsIds.add(item.id);
  }

  //remove item
  void remove(Item item) {
    _itemsIds.remove(item.id);
  }
}
