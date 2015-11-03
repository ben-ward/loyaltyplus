class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.integer :user_id
      t.float :amount
      t.integer :points, :default => 0

      t.timestamps null: false
    end
  end
end
