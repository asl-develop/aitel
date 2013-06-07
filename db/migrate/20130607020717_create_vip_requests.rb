class CreateVipRequests < ActiveRecord::Migration
  def change
    create_table :vip_requests do |t|
      t.references :user
      t.references :shop
      t.integer :status

      t.timestamps
    end
    add_index :vip_requests, :user_id
    add_index :vip_requests, :shop_id
  end
end
