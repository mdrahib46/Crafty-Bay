class AppUrls {
  AppUrls._();

  static const String _baseUrl = 'https://ecom-rs8e.onrender.com/api';

  static const String singUpUrl = "$_baseUrl/auth/signup";
  static const String otpVerifyUrl = "$_baseUrl/auth/verify-otp";
  static const String signInUrl = "$_baseUrl/auth/login";

  static const String homeCarouselSlides = "$_baseUrl/slides";

  static String getCategory(int pageSize, int pageNo) =>
      "$_baseUrl/categories?count=$pageSize&page=$pageNo";

  static String getProduct(int pageSize, int pageNo) =>
      "$_baseUrl/products?count=$pageSize&page=$pageNo";

  static String getWishList(int pageSize, int pageNo) =>
      "$_baseUrl/wishlist?count=$pageSize&page=$pageNo";

  static String productDetailsUrl(String productId) =>
      "$_baseUrl/products/id/$productId";

  static const String addToCartUrl = "$_baseUrl/cart";

  static const String cartListUrl = "$_baseUrl/cart";

  static String deleteWishListItem(String productId) =>
      "$_baseUrl/wishlist/$productId";

  static String getReviewList(int pageSize, int pageNo, String productId) =>
      "$_baseUrl/reviews?count=$pageSize&page=$pageNo&product=$productId";

  static const String createReview = "$_baseUrl/review";
}
