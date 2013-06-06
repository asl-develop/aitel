class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.references :user
      t.references :shop
      t.string :title
      t.string :content

      t.timestamps
    end
    add_index :messages, :user_id
    add_index :messages, :shop_id
  end
end
