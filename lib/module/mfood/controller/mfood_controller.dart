import 'package:clone_mtix/module/theater/controller/theater_controller.dart';
import 'package:clone_mtix/shared/utils/constants/constants.dart';

enum ListGroupFood {
  promo,
  combo,
  popcorn,
  fritters,
  frittersmaccheesebites,
  ligthmeal,
  bakerypastry,
  drinks,
}

class MfoodController extends TheaterController {
  List<Map<int, dynamic>> selectedGroupFood(ListGroupFood groupFood) {
    List<Map<int, dynamic>> listFood = [];

    if (groupFood.name == ListGroupFood.promo.name) {
      listFood = listFoodPromo;
    } else if (groupFood.name == ListGroupFood.combo.name) {
      listFood = listFoodCombo;
    } else if (groupFood.name == ListGroupFood.popcorn.name) {
      listFood = listFoodPopcorn;
    } else if (groupFood.name == ListGroupFood.fritters.name) {
      listFood = listFoodFritters;
    } else if (groupFood.name == ListGroupFood.frittersmaccheesebites.name) {
      listFood = listFoodFrittersMacCheese;
    } else if (groupFood.name == ListGroupFood.ligthmeal.name) {
      listFood = listFoodLightMeal;
    } else if (groupFood.name == ListGroupFood.bakerypastry.name) {
      listFood = listFoodBakeryPastry;
    } else if (groupFood.name == ListGroupFood.drinks.name) {
      listFood = listFoodDrinks;
    }

    return listFood;
  }

  List<Map<String, dynamic>> listFood = [
    {"Promo": ListGroupFood.promo},
    {"Combo": ListGroupFood.combo},
    {"Popcorn": ListGroupFood.popcorn},
    {"Fritters": ListGroupFood.fritters},
    {"Fritter + Mac & Cheese Bites": ListGroupFood.frittersmaccheesebites},
    {"Ligth Meal": ListGroupFood.ligthmeal},
    {"Bakery & Pastry": ListGroupFood.bakerypastry},
    {"Drinks": ListGroupFood.drinks},
  ];

  List<Map<int, dynamic>> listFoodPromo = [
    {
      1: {
        "image": xxipromo,
        "name": "Ramadan Combo 1",
        "amount": 80000,
        "detail": "1 Mamigor + 1 Lemon Tea Large",
        "timeServe": 15,
      }
    },
    {
      2: {
        "image": xxipromo,
        "name": "Ramadan Combo 2",
        "amount": 130000,
        "detail": "1 Popcprn Bucket Mix + 2 Lemon Tea Large",
        "timeServe": 15,
      }
    },
    {
      3: {
        "image": xxipromo,
        "name": "Ramadan Combo 3",
        "amount": 105000,
        "detail": "1 Croffle Original + 1 Croffle Nutella + 2 Lemon Tea Large",
        "timeServe": 15,
      }
    },
  ];

  List<Map<int, dynamic>> listFoodCombo = [
    {
      1: {
        "image": xxipromo,
        "name": "Favourite Combo 1 with Lychee Tea",
        "amount": 170000,
        "detail": "1 Popcorn Medium Mix + 2 Lychee Tea",
        "timeServe": 14,
      }
    },
    {
      2: {
        "image": xxipromo,
        "name": "Favourite Combo 2 with 2 Lychee Tea",
        "amount": 200000,
        "detail": "1 Popcorn Bucket Mix + 2 Lychee Tea",
        "timeServe": 15,
      }
    },
  ];

  List<Map<int, dynamic>> listFoodPopcorn = [
    {
      1: {
        "image": xxipromo,
        "name": "Popcorn Caramel Medium",
        "amount": 60000,
        "detail": "Popcorn Caramel Medium",
        "timeServe": 5,
      }
    },
    {
      2: {
        "image": xxipromo,
        "name": "Popcorn Balado Medium",
        "amount": 60000,
        "detail": "Popcorn Balado Medium",
        "timeServe": 5,
      }
    },
    {
      3: {
        "image": xxipromo,
        "name": "Popcorn Salt Medium",
        "amount": 30000,
        "detail": "Popcorn Salt Medium",
        "timeServe": 5,
      }
    },
  ];

  List<Map<int, dynamic>> listFoodFritters = [
    {
      1: {
        "image": xxipromo,
        "name": "Mamigor",
        "amount": 60000,
        "detail":
            "Perpaduan mac and cheese bites dengan mini pangsit goreng yang disajikan bersama dengan saus tomat dan sambal khas XXI Cafe",
        "timeServe": 5,
      }
    },
    {
      2: {
        "image": xxipromo,
        "name": "Soy Garlic Korean Chicken",
        "amount": 65000,
        "detail":
            "Daging ayam tanpa tulang yang digoreng renah dan dipadukan dengan saus soy garlic yang harum, gurih dan sedikit pedas",
        "timeServe": 15,
      }
    },
    {
      3: {
        "image": xxipromo,
        "name": "French Fires Small",
        "amount": 50000,
        "detail": "French Fires Small",
        "timeServe": 10,
      }
    },
  ];

  List<Map<int, dynamic>> listFoodFrittersMacCheese = [
    {
      1: {
        "image": xxipromo,
        "name": "French Fires Small + Mac Cheese Bites",
        "amount": 75000,
        "detail": "French Fires Small  + Mac Cheese Bites",
        "timeServe": 10,
      },
      2: {
        "image": xxipromo,
        "name": "French Fires Medium + Mac Cheese Bites",
        "amount": 95000,
        "detail": "French Fires Medium  + Mac Cheese Bites",
        "timeServe": 10,
      },
      3: {
        "image": xxipromo,
        "name": "French Fires Large + Mac Cheese Bites",
        "amount": 110000,
        "detail": "French Fires Large  + Mac Cheese Bites",
        "timeServe": 10,
      }
    },
  ];

  List<Map<int, dynamic>> listFoodLightMeal = [
    {
      1: {
        "image": xxipromo,
        "name": "Hot Dog with Java Tea",
        "amount": 85000,
        "detail": "1 Hot Dog + 1 Popcorn Small Salt + 1 Java Tea Small",
        "timeServe": 15,
      },
    },
  ];

  List<Map<int, dynamic>> listFoodBakeryPastry = [
    {
      1: {
        "image": xxipromo,
        "name": "Croffle Box",
        "amount": 180000,
        "detail":
            "6 Pcs Croffle : 2 pcs Croffle Original, 2 pcs Croffle Nutella, 2 pcs Croffle Strawberry Cheese",
        "timeServe": 25,
      },
    },
  ];

  List<Map<int, dynamic>> listFoodDrinks = [
    {
      1: {
        "image": xxipromo,
        "name": "Orange Jasmine Tea",
        "amount": 50000,
        "detail":
            "Aroma teh bunga melati dengan potongan buah jeruk sunkist asli serta selasih yang sangat menyegarkan",
        "timeServe": 10,
      },
      2: {
        "image": xxipromo,
        "name": "Coca-Cola",
        "amount": 25000,
        "detail": "Coca Cola Medium",
        "timeServe": 5,
      },
    },
  ];
}
