class CreateReserves < ActiveRecord::Migration
  def change
    create_table :reserves do |t|
      t.references :user
      t.references :shop
      t.integer :status
      t.datetime :expected_time

      t.timestamps
    end
    add_index :reserves, :user_id
    add_index :reserves, :shop_id
  end
end
