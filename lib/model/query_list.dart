abstract class Cursor {}

class QueryList<Item, C extends Cursor> {
  QueryList(this.list, this.cursor, this.hasMoreData);

  List<Item> list;
  C cursor;
  bool hasMoreData;
}
