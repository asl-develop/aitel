class CreateArrivalLogs < ActiveRecord::Migration
  def change
    create_table :arrival_logs do |t|
      t.references :user
      t.references :shop
      t.datetime :arrival_time

      t.timestamps
    end
    add_index :arrival_logs, :user_id
    add_index :arrival_logs, :shop_id
  end
end
