class FixActivitiesTable < ActiveRecord::Migration
  def change
        add_column :activities, :category_id, :string
        remove_column :activities, :section
        remove_column :activities, :query

  end
end
