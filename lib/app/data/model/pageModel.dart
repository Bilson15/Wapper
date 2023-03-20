class PageModel {
  int pageNumber = 0;
  bool isEmpty = false;

  PageModel({
    this.pageNumber = 0,
    this.isEmpty = false,
  });

  PageModel.fromJson(Map<String, dynamic> json) {
    pageNumber = json['pageable']['pageNumber'];
    isEmpty = json['empty'];
  }

  more() {
    this.pageNumber = this.pageNumber + 1;
  }
}
