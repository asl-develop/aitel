class CreateVips < ActiveRecord::Migration
  def change
    create_table :vips do |t|
      t.references :user
      t.references :shop
      t.string :property

      t.timestamps
    end
    add_index :vips, :user_id
    add_index :vips, :shop_id
  end
end
