abstract class Warehouse<T> {
  List<T> items = [];
  void add(T item) {
    this.items.add(item);
  }

  void remove(T item) {
    this.items.remove(item);
  }

  void update(T item) {
    this.items[items.indexWhere((element) => element == item)] = item;
  }

  void display() {
    this.items.forEach((element) {
      print(element.toString());
    });
  }
}
