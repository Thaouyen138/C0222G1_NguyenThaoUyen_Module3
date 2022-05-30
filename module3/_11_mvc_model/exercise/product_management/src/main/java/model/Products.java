package model;

public class    Products {
    //id, tên sản phẩm, giá sản phẩm, mô tả của sản phẩm, nhà sản xuất.
    private  int id;
    private String name;
    private double price;
    private  String describle, produce;

    public Products() {
    }

    public Products(int id, String name, double price, String describle, String produce) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.describle = describle;
        this.produce = produce;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getDescrible() {
        return describle;
    }

    public void setDescrible(String describle) {
        this.describle = describle;
    }

    public String getProduce() {
        return produce;
    }

    public void setProduce(String produce) {
        this.produce = produce;
    }
}
