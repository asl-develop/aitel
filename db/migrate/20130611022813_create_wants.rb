class CreateWants < ActiveRecord::Migration
  def change
    create_table :wants do |t|
      t.references :user
      t.integer :amount
      t.datetime :from_date
      t.integer :locked

      t.timestamps
    end
    add_index :wants, :user_id
  end
end
