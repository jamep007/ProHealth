class Food {
  String name, description;
  int calories;
  Food() {
    this.name = name;
    this.description = description;
    this.calories = calories;
  }
  Food.full(String name, String description, int calories) {
    this.name = name;
    this.description = description;
    this.calories = calories;
  }
}

class DietDay {
  List<Food> listOfBreakfastFoods;
  List<Food> listOfLunchFoods;
  List<Food> listOfDinnerFoods;
  List<Food> listOfSnackFoods;

  DietDay() {
    this.listOfBreakfastFoods = listOfBreakfastFoods;
    this.listOfLunchFoods = listOfLunchFoods;
    this.listOfDinnerFoods = listOfDinnerFoods;
    this.listOfSnackFoods = listOfSnackFoods;
  }

  DietDay.full(List<Food> breakfast, List<Food> lunch, List<Food> dinner,
      List<Food> snacks) {
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
    this.dietPlan = dietPlan;
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

List<DietPlan> allDietPlans = [];
