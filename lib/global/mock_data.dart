import 'package:hackathon_04_2021_shekels/core/dtos/linked_card_dto.dart';
import 'package:hackathon_04_2021_shekels/core/dtos/promotion_dto.dart';
import 'package:uuid/uuid.dart';

class MockData {
  static List<PromotionDto> getVisaPromos(LinkedCardDto card) {
    return [];
  }

  static List<PromotionDto> getMasterCardPromos(LinkedCardDto card) {
    return [
      PromotionDto(
        id: Uuid().v4(),
        name: "Next Movie",
        category: "Generic",
        description: "2\% Cashback",
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
        name: "Fillup",
        category: "Tasty",
        description: "\$18 Off",
        store: StoreDto(
          name: "rompetrol",
          imageUrl:
              "https://seeklogo.com/images/R/rompetrol-logo-5CA660BD8A-seeklogo.com.png",
          url: "https://www.rompetrol.md/",
        ),
        isApplied: false,
        expirationDate: DateTime.now(),
        fromCard: card,
      ),
      PromotionDto(
        id: Uuid().v4(),
        name: "Elite Tier",
        category: "Fintech",
        description: "10% Off",
        store: StoreDto(
          name: "Stockwise",
          imageUrl: "https://app.stockwise.io/static/media/Icon.026536ed.png",
          url: "https://stockwise.io/",
        ),
        isApplied: false,
        expirationDate: DateTime.now(),
        fromCard: card,
      ),
      PromotionDto(
        id: Uuid().v4(),
        name: "All In Store",
        category: "Gorgeous",
        description: "15% Off",
        store: StoreDto(
          name: "SPORTLANDIA",
          imageUrl: "https://sportlandia.md/assets/img/logo.png",
          url: "https://sportlandia.md/",
        ),
        isApplied: false,
        expirationDate: DateTime.now(),
        fromCard: card,
      ),
      PromotionDto(
        id: Uuid().v4(),
        name: "25 Liters",
        category: "Practical",
        description: "\$30 Cashback",
        store: StoreDto(
          name: "rompetrol",
          imageUrl:
              "https://seeklogo.com/images/R/rompetrol-logo-5CA660BD8A-seeklogo.com.png",
          url: "https://www.rompetrol.md/",
        ),
        isApplied: false,
        expirationDate: DateTime.now(),
        fromCard: card,
      ),
      PromotionDto(
        id: Uuid().v4(),
        name: "Next Purchase",
        category: "Fantastic",
        description: "\$29 Off",
        store: StoreDto(
          name: "NVIDIA",
          imageUrl:
              "https://img.favpng.com/18/20/13/nvidia-logo-geforce-intel-graphics-processing-unit-png-favpng-XSEbZScDrdBvrVF5T5QJkzcr2.jpg",
          url: "https://www.nvidia.com/",
        ),
        isApplied: false,
        expirationDate: DateTime.now(),
        fromCard: card,
      ),
      PromotionDto(
        id: Uuid().v4(),
        name: "Vin Pastoral",
        category: "Small",
        description: "\$23 Off",
        store: StoreDto(
          name: "Nr1",
          imageUrl: "https://nr1.md/public/images/logo.png",
          url: "https://nr1.md/",
        ),
        isApplied: false,
        expirationDate: DateTime.now(),
        fromCard: card,
      ),
      PromotionDto(
        id: Uuid().v4(),
        name: "All In Store",
        category: "Incredible",
        description: "34\% Cashback",
        store: StoreDto(
          name: "SPORTLANDIA",
          imageUrl: "https://sportlandia.md/assets/img/logo.png",
          url: "https://sportlandia.md/",
        ),
        isApplied: false,
        expirationDate: DateTime.now(),
        fromCard: card,
      ),
      PromotionDto(
        id: Uuid().v4(),
        name: "25 Liters",
        category: "Awesome",
        description: "\$44 Off",
        store: StoreDto(
          name: "rompetrol",
          imageUrl:
              "https://seeklogo.com/images/R/rompetrol-logo-5CA660BD8A-seeklogo.com.png",
          url: "https://www.rompetrol.md/",
        ),
        isApplied: false,
        expirationDate: DateTime.now(),
        fromCard: card,
      ),
      PromotionDto(
        id: Uuid().v4(),
        name: "Next Purchase",
        category: "Handcrafted",
        description: "\$25 Off",
        store: StoreDto(
          name: "NVIDIA",
          imageUrl:
              "https://img.favpng.com/18/20/13/nvidia-logo-geforce-intel-graphics-processing-unit-png-favpng-XSEbZScDrdBvrVF5T5QJkzcr2.jpg",
          url: "https://www.nvidia.com/",
        ),
        isApplied: false,
        expirationDate: DateTime.now(),
        fromCard: card,
      ),
      PromotionDto(
        id: Uuid().v4(),
        name: "Home Loan, First House",
        category: "Refined",
        description: "\$500 Off per Month",
        store: StoreDto(
          name: "MAIB",
          imageUrl:
              "https://fci.nl/sites/default/files/MAIB%20Moldova%20Agroindbank.jpg",
          url: "https://www.maib.md/",
        ),
        isApplied: false,
        expirationDate: DateTime.now(),
        fromCard: card,
      ),
      PromotionDto(
        id: Uuid().v4(),
        name: "Next Purchase",
        category: "Incredible",
        description: "\$7 Cashback",
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
        name: "All In Store",
        category: "Sleek",
        description: "23% Cashback",
        store: StoreDto(
          name: "SPORTLANDIA",
          imageUrl: "https://sportlandia.md/assets/img/logo.png",
          url: "https://sportlandia.md/",
        ),
        isApplied: false,
        expirationDate: DateTime.now(),
        fromCard: card,
      ),
      PromotionDto(
        id: Uuid().v4(),
        name: "Fillup",
        category: "Handmade",
        description: "\$2 Cashback",
        store: StoreDto(
          name: "rompetrol",
          imageUrl:
              "https://seeklogo.com/images/R/rompetrol-logo-5CA660BD8A-seeklogo.com.png",
          url: "https://www.rompetrol.md/",
        ),
        isApplied: false,
        expirationDate: DateTime.now(),
        fromCard: card,
      ),
      PromotionDto(
        id: Uuid().v4(),
        name: "Credit Cappuccino",
        category: "Handcrafted",
        description: "Up to 200,000 LEI",
        store: StoreDto(
          name: "MAIB",
          imageUrl:
              "https://fci.nl/sites/default/files/MAIB%20Moldova%20Agroindbank.jpg",
          url: "https://www.maib.md/",
        ),
        isApplied: false,
        expirationDate: DateTime.now(),
        fromCard: card,
      ),
      PromotionDto(
        id: Uuid().v4(),
        name: "Next Purchase",
        category: "Fantastic",
        description: "\$25 Cashback",
        store: StoreDto(
          name: "NVIDIA",
          imageUrl:
              "https://img.favpng.com/18/20/13/nvidia-logo-geforce-intel-graphics-processing-unit-png-favpng-XSEbZScDrdBvrVF5T5QJkzcr2.jpg",
          url: "https://www.nvidia.com/",
        ),
        isApplied: false,
        expirationDate: DateTime.now(),
        fromCard: card,
      ),
      PromotionDto(
        id: Uuid().v4(),
        name: "Next Purchase",
        category: "Awesome",
        description: "\$49 Off",
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
        name: "All Online Purchases",
        category: "Unbranded",
        description: "23% Off",
        store: StoreDto(
          name: "SPORTLANDIA",
          imageUrl: "https://sportlandia.md/assets/img/logo.png",
          url: "https://sportlandia.md/",
        ),
        isApplied: false,
        expirationDate: DateTime.now(),
        fromCard: card,
      ),
      PromotionDto(
        id: Uuid().v4(),
        name: "All Food",
        category: "Unbranded",
        description: "\$19 Off",
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
        name: "All Online Purchases",
        category: "Generic",
        description: "\$37 Cashback",
        store: StoreDto(
          name: "SPORTLANDIA",
          imageUrl: "https://sportlandia.md/assets/img/logo.png",
          url: "https://sportlandia.md/",
        ),
        isApplied: false,
        expirationDate: DateTime.now(),
        fromCard: card,
      ),
    ];
  }
}
