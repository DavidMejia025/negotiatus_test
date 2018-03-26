$( document ).ready(function() {
  $("#order_customer_id").change(function(){
    var customer_id = parseInt($("#order_customer_id").val())
    var customer_address = $(".customers_information").data("datas").find(customer => customer.id === customer_id).address
    $("#order_address").val(customer_address)
  });
});