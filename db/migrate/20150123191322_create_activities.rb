class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.string :name
      t.string :activity_img

      t.timestamps
    end
  end
end
