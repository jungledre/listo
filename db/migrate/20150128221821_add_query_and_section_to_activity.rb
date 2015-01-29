class AddQueryAndSectionToActivity < ActiveRecord::Migration
  def change
    add_column :activities, :query, :string
    add_column :activities, :section, :string
  end
end
