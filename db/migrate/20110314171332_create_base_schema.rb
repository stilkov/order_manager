class CreateBaseSchema < ActiveRecord::Migration
  def self.up
    create_table :orders, :force => true do |t|
      t.date     :order_date
      t.date     :shipping_date
      t.string   :customer_description
      t.string   :customer
      t.string   :billing_address
      t.string   :shipping_address
      t.string   :state
      t.decimal  :total,                :precision => 10, :scale => 2
      t.integer  :cancellation_id
      t.timestamps
    end

    create_table :order_items do |t|
      t.integer :order_id
      t.integer :quantity
      t.string  :product
      t.string  :product_description
      t.decimal :price
    end

    create_table :cancellations do |t|
      t.date     :cancellation_date
      t.string   :reason
      t.timestamps
    end
    
  end
  
  def self.down
    drop_table :orders
    drop_table :order_items
    drop_table :cancellations
  end
end
