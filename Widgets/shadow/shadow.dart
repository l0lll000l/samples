  Container(
      width: 180,
      height: 200,
      decoration: BoxDecoration(
          boxShadow: [TShadowStyle.verticalProductShadow],         //vertical prodct shadow
          color: dark ? TColors.darkerGrey : TColors.light,
          borderRadius: BorderRadius.circular(TSizes.productImageRadius)),
    );
-------------------------------------------------------------

class TShadowStyle {
  static final verticalProductShadow = BoxShadow(                    
      color: TColors.darkerGrey.withOpacity(0.1),
      blurRadius: 50,
      spreadRadius: 7,
      offset: const Offset(0, 2));
  static final horrizondalProductShadow = BoxShadow(
      color: TColors.darkerGrey.withOpacity(0.1),
      blurRadius: 50,
      spreadRadius: 7,
      offset: const Offset(0, 2));
}



//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
