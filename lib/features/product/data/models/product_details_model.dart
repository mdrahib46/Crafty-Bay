// "_id": "6812588dea40bfc6edc673ed",
// "title": "সহজ ভাষায় অ্যালগরিদম",
// },
// "description": "এক কথায় বলতে হলে, একদম বিগিনারদের জন্য এক অসাধারণ খণ্ডাংশ এই বইটি। যাদের প্রোগ্রামিং নিয়ে ন্যূনতম জ্ঞান আছে, তারাও অনায়াসে এই বইয়ের আদি-অন্ত উদ্ধার করে ফেলতে পারবেন। নো ডাউট! একটি সত্যি কথা কি জানেন? গুগোল-ফেসবুক যারা বানিয়েছেন, তারাও কিন্তু একটা সময় আমার-আপনার মতোই একজন জিরো লেভেলের প্রোগ্রামার ছিল। প্রোগ্রামিং জানার জন্য কম্পিউটারের খুঁটিনাটি সম্পর্কে যে খুব আহামরি কিছু জানা লাগে, এই কথাটিই ভুল। শুনে অবাক হবার কিছু নেই। ব্যাপারটা একদমই সত্যি। তবে আপনার থাকা চাই প্রোগ্রামিংয়ের প্রতি অকৃত্রিম ভালোবাসা আর নিজেকে সময় দেওয়া। প্রোগ্রামিংয়ে ‘শুরু থেকে গুরু’ তখনই হতে পারবেন যখন আপনি প্রোগ্রামিংয়ের পেছনে ‘লেগে’ থাকবেন। এই ‘লেগে থাকা’-টাই আপনাকে গুগোল-ফেসবুক থেকেও আরো অনেক বেশি ওপরে নিয়ে যেতে সক্ষম। তবে অ্যালগরিদমের কথা এলেই সবাই পাশ কাটিয়ে চলে যেতে চান। এই বইটি লেখার প্রধান উদ্দেশ্যই ছিল এই পালিয়ে বেড়ানো মানুষগুলোর মনে অ্যালগরিদমের ভালোবাসা পৌঁছিয়ে দেওয়া। বানিয়ে বলছি না; বইটি শুরু করুন— কিছুক্ষণ পর আপনি নিজেই নিজেকে বলবেন, ‘একটু সময় দিলেই আমি পারব!",
// "photos": [
// "https://ds.rokomari.store/rokomari110/ProductNew20190903/260X372/Sohoj_Bhashay_Algorithm-Ihsanul_Islam-ab6e3-227461.jpg"
// ],
// "colors": [
//  "White"
// ],
// "sizes": [
//  "M"
// ],
// "current_price": 258,
// "rating": 4.5,
// "quantity": 1,

class ProductDetailsModel {
  final String id;
  final String title;
  final String description;
  final List<String> photos;
  final List<String> colors;
  final List<String> size;
  final int currentPrice;
  final int quantity;
  final double rating;

  ProductDetailsModel({
    required this.id,
    required this.title,
    required this.description,
    required this.photos,
    required this.colors,
    required this.size,
    required this.currentPrice,
    required this.quantity,
    required this.rating,
  });

  factory ProductDetailsModel.formJson(Map<String, dynamic> jsonData) {
    return ProductDetailsModel(
      id: jsonData['_id'],
      title: jsonData['title'],
      description: jsonData['description'],
      photos: List.from(jsonData['photos']),
      colors: List.from(jsonData['colors']),
      size: List.from(jsonData['sizes']),
      currentPrice: jsonData['current_price'],
      quantity: jsonData['quantity'],
      rating: 4.5
    );
  }
}
