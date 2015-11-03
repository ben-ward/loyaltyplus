class SetDefaultOnActivitiesPoints < ActiveRecord::Migration
  def change
    change_column :activities, :points, :integer, :default => 0
  end
end
