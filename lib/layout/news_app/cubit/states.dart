abstract class NewsStates{}

class AppInitialStates extends NewsStates{}

class NewsBottomNavBarStates extends NewsStates{}

class NewsGetBusinessLoadingStates extends NewsStates{}

class NewsGetBusinessSuccessStates extends NewsStates{}

class NewsGetBusinessErrorStates extends NewsStates{

  late final String error;
  NewsGetBusinessErrorStates(this.error);
}

class NewsGetSportsLoadingStates extends NewsStates{}

class NewsGetSportsSuccessStates extends NewsStates{}

class NewsGetSportsErrorStates extends NewsStates{

  late final String error;
  NewsGetSportsErrorStates(this.error);
}

class NewsGetScienceLoadingStates extends NewsStates{}

class NewsGetScienceSuccessStates extends NewsStates{}

class NewsGetScienceErrorStates extends NewsStates{

  late final String error;
  NewsGetScienceErrorStates(this.error);
}

class NewsChangeModeStates extends NewsStates{}

class NewsGetSearchLoadingStates extends NewsStates{}

class NewsGetSearchSuccessStates extends NewsStates{}

class NewsGetSearchErrorStates extends NewsStates{

   final String error;
  NewsGetSearchErrorStates(this.error);
}











