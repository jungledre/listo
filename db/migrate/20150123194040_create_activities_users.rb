class CreateActivitiesUsers < ActiveRecord::Migration
  def change
    create_table :activities_users do |t|
      t.references :activity, index: true
      t.references :user, index: true

      t.timestamps
    end
  end
end
