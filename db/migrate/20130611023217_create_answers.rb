class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.references :want
      t.references :shop
      t.integer :status
      t.integer :selected

      t.timestamps
    end
    add_index :answers, :want_id
    add_index :answers, :shop_id
  end
end
