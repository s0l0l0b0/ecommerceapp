function addToCart(productId){
    fetch("/add-to-cart?productId=" + productId, {
        method: "POST"
    }).then(res => {
        if (res.ok){
            alert("Added to the cart!")
        }
    })
        .catch(function (){
            alert("Error occurred!");
        });
}