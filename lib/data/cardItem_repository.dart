import 'package:shared_preference/model/category_item.dart';

import '../model/card_item.dart';
import '../utils/icons.dart';

class CardRepository {
  static List<CardItem> getCards() {
    List<CardItem> cards = [];

    cards.add(CardItem(name: "UI", price: 50, desc: "Advanced mobile interface design", hours: "3 h 30 min", imgPath: MyIcons.card1));
    cards.add(CardItem(name: "Swift", price: 40, desc: "Advanced iOS apps", hours: "1 h 20 min", imgPath: MyIcons.card2));
    cards.add(CardItem(name: "HTML", price: 35, desc: "Advanced web applications", hours: "2 h 15 min", imgPath: MyIcons.card3));
    cards.add(CardItem(name: "Scrum", price: 45, desc: "Advanced project organization course", hours: "1 h 55 min", imgPath: MyIcons.card4));

    return cards;
  }

  static List<CategoryItem> getCategories() {
    List<CategoryItem> categories = [];

    categories.add(CategoryItem(text: "#CSS"));
    categories.add(CategoryItem(text: "#UX"));
    categories.add(CategoryItem(text: "#Swift"));
    categories.add(CategoryItem(text: "#UI"));
    categories.add(CategoryItem(text: "#Scrum"));
    categories.add(CategoryItem(text: "#HTML"));
    categories.add(CategoryItem(text: "#iOS"));

    return categories;
  }
}
