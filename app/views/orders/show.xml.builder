xml.instruct! :xml, :encoding => "UTF-8"
xml.order :xmlns => 'http://example.com/schemas/ordermanagement', 'xml:base' => base_uri, 'href' => order_path(@order) do
  xml.customer do
    xml.name @order.customer_description
    xml.link @order.customer
  end
      
  xml.date @order.order_date.xmlschema
  xml.state @order.state.to_s
  if @order.state == :cancelled
    xml.cancellation cancellation_path(@order.cancellation)
  end
  xml.shippingDate @order.shipping_date.try(:xmlschema)
  xml.billingAddress @order.billing_address
  xml.shippingAddress @order.shipping_address
  xml.total @order.total, :currency => 'EUR' 
  if @order.order_items then
    xml.items {
    @order.order_items.each do |item|
      xml.item {
        xml.product item.product
        xml.productDescription item.product_description
        xml.quantity item.quantity
        xml.price item.price, :currency => 'EUR' 
      }
    end
   }
 end
end
