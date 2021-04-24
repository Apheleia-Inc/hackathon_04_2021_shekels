import 'package:hackathon_04_2021_shekels/core/dtos/linked_card_dto.dart';
import 'package:hackathon_04_2021_shekels/core/dtos/promotion_dto.dart';
import 'package:uuid/uuid.dart';

class MockData {
  static List<PromotionDto> getVisaPromos(LinkedCardDto card) {
    return [
      PromotionDto(
        id: Uuid().v4(),
        name: "Handcrafted Fresh Salad",
        category: "Generic",
        description: "\$9 Cashback",
        store: StoreDto(
          name: "Starbucks",
          imageUrl:
              "https://upload.wikimedia.org/wikipedia/en/thumb/d/d3/Starbucks_Corporation_Logo_2011.svg/1200px-Starbucks_Corporation_Logo_2011.svg.png",
          url: "https://www.starbucks.com/",
        ),
        isApplied: false,
        expirationDate: DateTime.now(),
        fromCard: card,
      ),
      PromotionDto(
        id: Uuid().v4(),
        name: "Gorgeous Granite Computer",
        category: "Tasty",
        description: "\$1 Cashback",
        store: StoreDto(
          name: "Turbo Tax",
          imageUrl:
              "https://blog.turbotax.intuit.com/wp-content/uploads/2019/04/cropped-favicon.png",
          url: "https://turbotax.intuit.com/",
        ),
        isApplied: false,
        expirationDate: DateTime.now(),
        fromCard: card,
      ),
      PromotionDto(
        id: Uuid().v4(),
        name: "Rustic Granite Bacon",
        category: "Sleek",
        description: "67% Off",
        store: StoreDto(
          name: "Amazon",
          imageUrl:
              "http://media.corporate-ir.net/media_files/IROL/17/176060/Oct18/Amazon%20logo.PNG",
          url: "https://www.amazon.com/",
        ),
        isApplied: false,
        expirationDate: DateTime.now(),
        fromCard: card,
      ),
      PromotionDto(
        id: Uuid().v4(),
        name: "Refined Rubber Shoes",
        category: "Gorgeous",
        description: "49% Off",
        store: StoreDto(
          name: "Dell",
          imageUrl:
              "https://upload.wikimedia.org/wikipedia/commons/thumb/4/48/Dell_Logo.svg/480px-Dell_Logo.svg.png",
          url: "http://dell.com/",
        ),
        isApplied: false,
        expirationDate: DateTime.now(),
        fromCard: card,
      ),
      PromotionDto(
        id: Uuid().v4(),
        name: "Intelligent Concrete Mouse",
        category: "Practical",
        description: "\$40 Off",
        store: StoreDto(
          name: "Turbo Tax",
          imageUrl:
              "https://blog.turbotax.intuit.com/wp-content/uploads/2019/04/cropped-favicon.png",
          url: "https://turbotax.intuit.com/",
        ),
        isApplied: false,
        expirationDate: DateTime.now(),
        fromCard: card,
      ),
      PromotionDto(
        id: Uuid().v4(),
        name: "Awesome Soft Shirt",
        category: "Fantastic",
        description: "\$61 Off",
        store: StoreDto(
          name: "Amazon",
          imageUrl:
              "http://media.corporate-ir.net/media_files/IROL/17/176060/Oct18/Amazon%20logo.PNG",
          url: "https://www.amazon.com/",
        ),
        isApplied: false,
        expirationDate: DateTime.now(),
        fromCard: card,
      ),
      PromotionDto(
        id: Uuid().v4(),
        name: "Licensed Rubber Computer",
        category: "Small",
        description: "\$78 Off",
        store: StoreDto(
          name: "Dell",
          imageUrl:
              "https://upload.wikimedia.org/wikipedia/commons/thumb/4/48/Dell_Logo.svg/480px-Dell_Logo.svg.png",
          url: "http://dell.com/",
        ),
        isApplied: false,
        expirationDate: DateTime.now(),
        fromCard: card,
      ),
      PromotionDto(
        id: Uuid().v4(),
        name: "Handmade Concrete Shoes",
        category: "Incredible",
        description: "\$9 Cashback",
        store: StoreDto(
          name: "Amazon",
          imageUrl:
              "http://media.corporate-ir.net/media_files/IROL/17/176060/Oct18/Amazon%20logo.PNG",
          url: "https://www.amazon.com/",
        ),
        isApplied: false,
        expirationDate: DateTime.now(),
        fromCard: card,
      ),
      PromotionDto(
        id: Uuid().v4(),
        name: "Fantastic Granite Tuna",
        category: "Awesome",
        description: "\$8 Cashback",
        store: StoreDto(
          name: "Google Play",
          imageUrl:
              "https://cdn4.iconfinder.com/data/icons/social-media-logos-6/512/103-GooglePlay_play_google_play_apps-512.png",
          url: "https://play.google.com/",
        ),
        isApplied: false,
        expirationDate: DateTime.now(),
        fromCard: card,
      ),
    ];
  }

  static List<PromotionDto> getMasterCardPromos(LinkedCardDto card) {
    return [
      PromotionDto(
        id: Uuid().v4(),
        name: "Handmade Fresh Tuna",
        category: "Handcrafted",
        description: "\$36 Off",
        store: StoreDto(
          name: "Turbo Tax",
          imageUrl:
              "https://blog.turbotax.intuit.com/wp-content/uploads/2019/04/cropped-favicon.png",
          url: "https://turbotax.intuit.com/",
        ),
        isApplied: false,
        expirationDate: DateTime.now(),
        fromCard: card,
      ),
      PromotionDto(
        id: Uuid().v4(),
        name: "Tasty Frozen Shoes",
        category: "Refined",
        description: "87% Off",
        store: StoreDto(
          name: "Starbucks",
          imageUrl:
              "https://upload.wikimedia.org/wikipedia/en/thumb/d/d3/Starbucks_Corporation_Logo_2011.svg/1200px-Starbucks_Corporation_Logo_2011.svg.png",
          url: "https://www.starbucks.com/",
        ),
        isApplied: false,
        expirationDate: DateTime.now(),
        fromCard: card,
      ),
      PromotionDto(
        id: Uuid().v4(),
        name: "Practical Granite Bacon",
        category: "Incredible",
        description: "\$7 Cashback",
        store: StoreDto(
          name: "Turbo Tax",
          imageUrl:
              "https://blog.turbotax.intuit.com/wp-content/uploads/2019/04/cropped-favicon.png",
          url: "https://turbotax.intuit.com/",
        ),
        isApplied: false,
        expirationDate: DateTime.now(),
        fromCard: card,
      ),
      PromotionDto(
        id: Uuid().v4(),
        name: "Refined Metal Tuna",
        category: "Sleek",
        description: "1 Cashback",
        store: StoreDto(
          name: "Starbucks",
          imageUrl:
              "https://upload.wikimedia.org/wikipedia/en/thumb/d/d3/Starbucks_Corporation_Logo_2011.svg/1200px-Starbucks_Corporation_Logo_2011.svg.png",
          url: "https://www.starbucks.com/",
        ),
        isApplied: false,
        expirationDate: DateTime.now(),
        fromCard: card,
      ),
      PromotionDto(
        id: Uuid().v4(),
        name: "Refined Soft Tuna",
        category: "Handmade",
        description: "80 Cashback",
        store: StoreDto(
          name: "Google Play",
          imageUrl:
              "https://cdn4.iconfinder.com/data/icons/social-media-logos-6/512/103-GooglePlay_play_google_play_apps-512.png",
          url: "https://play.google.com/",
        ),
        isApplied: false,
        expirationDate: DateTime.now(),
        fromCard: card,
      ),
      PromotionDto(
        id: Uuid().v4(),
        name: "Unbranded Wooden Keyboard",
        category: "Handcrafted",
        description: "\$ Cashback",
        store: StoreDto(
          name: "Amazon",
          imageUrl:
              "http://media.corporate-ir.net/media_files/IROL/17/176060/Oct18/Amazon%20logo.PNG",
          url: "https://www.amazon.com/",
        ),
        isApplied: false,
        expirationDate: DateTime.now(),
        fromCard: card,
      ),
      PromotionDto(
        id: Uuid().v4(),
        name: "Sleek Fresh Cheese",
        category: "Fantastic",
        description: "\$2 Cashback",
        store: StoreDto(
          name: "Starbucks",
          imageUrl:
              "https://upload.wikimedia.org/wikipedia/en/thumb/d/d3/Starbucks_Corporation_Logo_2011.svg/1200px-Starbucks_Corporation_Logo_2011.svg.png",
          url: "https://www.starbucks.com/",
        ),
        isApplied: false,
        expirationDate: DateTime.now(),
        fromCard: card,
      ),
      PromotionDto(
        id: Uuid().v4(),
        name: "Incredible Soft Towels",
        category: "Awesome",
        description: "\$49 Off",
        store: StoreDto(
          name: "Turbo Tax",
          imageUrl:
              "https://blog.turbotax.intuit.com/wp-content/uploads/2019/04/cropped-favicon.png",
          url: "https://turbotax.intuit.com/",
        ),
        isApplied: false,
        expirationDate: DateTime.now(),
        fromCard: card,
      ),
      PromotionDto(
        id: Uuid().v4(),
        name: "Sleek Fresh Shirt",
        category: "Unbranded",
        description: "\$1 Cashback",
        store: StoreDto(
          name: "Starbucks",
          imageUrl:
              "https://upload.wikimedia.org/wikipedia/en/thumb/d/d3/Starbucks_Corporation_Logo_2011.svg/1200px-Starbucks_Corporation_Logo_2011.svg.png",
          url: "https://www.starbucks.com/",
        ),
        isApplied: false,
        expirationDate: DateTime.now(),
        fromCard: card,
      ),
      PromotionDto(
        id: Uuid().v4(),
        name: "Gorgeous Fresh Cheese",
        category: "Unbranded",
        description: "65% Off",
        store: StoreDto(
          name: "Starbucks",
          imageUrl:
              "https://upload.wikimedia.org/wikipedia/en/thumb/d/d3/Starbucks_Corporation_Logo_2011.svg/1200px-Starbucks_Corporation_Logo_2011.svg.png",
          url: "https://www.starbucks.com/",
        ),
        isApplied: false,
        expirationDate: DateTime.now(),
        fromCard: card,
      ),
      PromotionDto(
        id: Uuid().v4(),
        name: "Gorgeous Wooden Shirt",
        category: "Generic",
        description: "37 Cashback",
        store: StoreDto(
          name: "Starbucks",
          imageUrl:
              "https://upload.wikimedia.org/wikipedia/en/thumb/d/d3/Starbucks_Corporation_Logo_2011.svg/1200px-Starbucks_Corporation_Logo_2011.svg.png",
          url: "https://www.starbucks.com/",
        ),
        isApplied: false,
        expirationDate: DateTime.now(),
        fromCard: card,
      ),
    ];
  }
}
