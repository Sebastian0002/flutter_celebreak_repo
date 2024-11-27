class Filter with ChangeState{
  final String title;  
  final TypeFilter type;
  Filter({required this.title, required this.type});  
}

enum TypeFilter {
  all,
  sports,
  food,
  kids,
  creative,
  popular,
  calm
}

mixin ChangeState {
  bool? _selected;
  bool? get selected => _selected;
  void setSelected(bool? selected){
    _selected = selected;
  }
}

//filter list deduced from the figma
final List<Filter> filterList = [
  Filter(title: "All", type: TypeFilter.all)..setSelected(true),
  Filter(title: "Sports", type: TypeFilter.sports),
  Filter(title: "Food", type: TypeFilter.food),
  Filter(title: "Kids", type: TypeFilter.kids),
  Filter(title: "Creative", type: TypeFilter.creative),
  Filter(title: "Popular", type: TypeFilter.popular),
  Filter(title: "Calm", type: TypeFilter.calm),
];