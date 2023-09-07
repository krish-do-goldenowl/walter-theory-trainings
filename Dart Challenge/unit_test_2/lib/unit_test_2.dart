List<int> getSameElement(List<int> firstList, List<int> secondList) {
  List<int> myList = [];
  for (int item in firstList) {
    if (secondList.contains(item) && !myList.contains(item)) {
      myList.add(item);
    }
  }
  return myList;
}
