class CartModel {
  String cartId;
  String cartImage;
  String cartName;
  int cartPrice;
  int cartQuantity;
  var cartUnit;

  CartModel(
      {this.cartId,
      this.cartImage,
      this.cartName,
      this.cartUnit,
      this.cartPrice,
      this.cartQuantity});
}
