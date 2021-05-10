class Food {
  List<Branded> branded;
  List<Self> self;
  List<Common> common;

  Food({this.branded, this.self, this.common});

  Food.fromJson(Map<String, dynamic> json) {
    if (json['branded'] != null) {
      branded = new List<Branded>();
      json['branded'].forEach((v) {
        branded.add(new Branded.fromJson(v));
      });
    }
    if (json['self'] != null) {
      self = new List<Self>();
      json['self'].forEach((v) {
        self.add(new Self.fromJson(v));
      });
    }
    if (json['common'] != null) {
      common = new List<Common>();
      json['common'].forEach((v) {
        common.add(new Common.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.branded != null) {
      data['branded'] = this.branded.map((v) => v.toJson()).toList();
    }
    if (this.self != null) {
      data['self'] = this.self.map((v) => v.toJson()).toList();
    }
    if (this.common != null) {
      data['common'] = this.common.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Branded {
  String foodName;
  String image;
  String servingUnit;
  String nixBrandId;
  String brandNameItemName;
  num servingQty;
  int nfCalories;
  String brandName;
  int brandType;
  String nixItemId;

  Branded(
      {this.foodName,
      this.image,
      this.servingUnit,
      this.nixBrandId,
      this.brandNameItemName,
      this.servingQty,
      this.nfCalories,
      this.brandName,
      this.brandType,
      this.nixItemId});

  Branded.fromJson(Map<String, dynamic> json) {
    foodName = json['food_name'];
    image = json['image'];
    servingUnit = json['serving_unit'];
    nixBrandId = json['nix_brand_id'];
    brandNameItemName = json['brand_name_item_name'];
    servingQty = json['serving_qty'];
    nfCalories = json['nf_calories'];
    brandName = json['brand_name'];
    brandType = json['brand_type'];
    nixItemId = json['nix_item_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['food_name'] = this.foodName;
    data['image'] = this.image;
    data['serving_unit'] = this.servingUnit;
    data['nix_brand_id'] = this.nixBrandId;
    data['brand_name_item_name'] = this.brandNameItemName;
    data['serving_qty'] = this.servingQty;
    data['nf_calories'] = this.nfCalories;
    data['brand_name'] = this.brandName;
    data['brand_type'] = this.brandType;
    data['nix_item_id'] = this.nixItemId;
    return data;
  }
}

class Self {
  String foodName;
  String servingUnit;
  Null nixBrandId;
  double servingQty;
  double nfCalories;
  Null brandName;
  String uuid;
  Null nixItemId;

  Self(
      {this.foodName,
      this.servingUnit,
      this.nixBrandId,
      this.servingQty,
      this.nfCalories,
      this.brandName,
      this.uuid,
      this.nixItemId});

  Self.fromJson(Map<String, dynamic> json) {
    foodName = json['food_name'];
    servingUnit = json['serving_unit'];
    nixBrandId = json['nix_brand_id'];
    servingQty = json['serving_qty'];
    nfCalories = json['nf_calories'];
    brandName = json['brand_name'];
    uuid = json['uuid'];
    nixItemId = json['nix_item_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['food_name'] = this.foodName;
    data['serving_unit'] = this.servingUnit;
    data['nix_brand_id'] = this.nixBrandId;
    data['serving_qty'] = this.servingQty;
    data['nf_calories'] = this.nfCalories;
    data['brand_name'] = this.brandName;
    data['uuid'] = this.uuid;
    data['nix_item_id'] = this.nixItemId;
    return data;
  }
}

class Common {
  String foodName;
  String image;
  String tagId;
  String tagName;

  Common({this.foodName, this.image, this.tagId, this.tagName});

  Common.fromJson(Map<String, dynamic> json) {
    foodName = json['food_name'];
    image = json['image'];
    tagId = json['tag_id'];
    tagName = json['tag_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['food_name'] = this.foodName;
    data['image'] = this.image;
    data['tag_id'] = this.tagId;
    data['tag_name'] = this.tagName;
    return data;
  }
}

class DietDay {
  List<Branded> listOfBreakfastFoods;
  List<Branded> listOfLunchFoods;
  List<Branded> listOfDinnerFoods;
  List<Branded> listOfSnackFoods;

  DietDay() {
    this.listOfBreakfastFoods = listOfBreakfastFoods;
    this.listOfLunchFoods = listOfLunchFoods;
    this.listOfDinnerFoods = listOfDinnerFoods;
    this.listOfSnackFoods = listOfSnackFoods;
  }

  DietDay.full(List<Branded> breakfast, List<Branded> lunch,
      List<Branded> dinner, List<Branded> snacks) {
    this.listOfBreakfastFoods = breakfast;
    this.listOfLunchFoods = lunch;
    this.listOfDinnerFoods = dinner;
    this.listOfSnackFoods = snacks;
  }
}

class DietPlan {
  List<DietDay> dietPlan;
  String name, description;
  int dailyCalorieGoal;

  DietPlan() {
    this.dietPlan = [];
    this.name = name;
    this.description = description;
    this.dailyCalorieGoal = dailyCalorieGoal;
  }

  DietPlan.full(List<DietDay> plan, String name, String description, int goal) {
    this.dietPlan = plan;
    this.name = name;
    this.description = description;
    this.dailyCalorieGoal = goal;
  }
}
