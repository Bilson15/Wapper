class PageModel {
  int pageNumber = 0;

  PageModel({
    this.pageNumber = 0,
  });

  PageModel.fromJson(Map<String, dynamic> json) {
    pageNumber = json['pageNumber'];
  }

  more() {
    this.pageNumber = this.pageNumber + 1;
  }
}
