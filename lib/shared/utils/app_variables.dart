enum Category { games, food }

class AppVariables {
  static String getCategoryString(Category category) {
    switch (category) {
      case Category.food:
        return 'Food';
      case Category.games:
        return 'Games';
    }
  }
}
