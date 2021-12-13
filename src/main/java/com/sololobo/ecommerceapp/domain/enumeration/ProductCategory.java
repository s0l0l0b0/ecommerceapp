package com.sololobo.ecommerceapp.domain.enumeration;

public enum ProductCategory {
    CAR("/car", "https://www.exoticcarlist.com/blog/wp-content/uploads/2017/02/5636b9710ab58f6455a19a931a7631b7_bugatti-veyron-super-sport-bugatti-veyron-super-sport-clipart_1600-1060.jpeg"),
    BIKE("/bike", "https://silodrome.com/wp-content/uploads/2015/03/BMW-Motorcycle-1-1600x1000.jpg"),
    BICYCLE("/bicycle", "https://images.singletracks.com/blog/wp-content/uploads/2016/05/20160506_135551-1200x675.jpg");

    private final String url;
    private final String imgUrl;

    ProductCategory(String url, String imgUrl) {
        this.url = url;
        this.imgUrl = imgUrl;
    }

    public String getImgUrl() {
        return imgUrl;
    }

    public String getUrl() {
        return url;
    }
}
