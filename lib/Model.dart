List<productModel> productModelList = <productModel>[];

class productModel {
  int categoryID;
  String categoryName;
  int productNumber;

  productModel({
    this.categoryID=0,
    this.categoryName="",
    this.productNumber=0,
  });
}

void addModel(int ID , String name , int num){
  var a=productModel();
  a.categoryID=ID;
  a.categoryName=name;
  a.productNumber=num;
  productModelList.add(a);
}

var totalProducts=1300;
