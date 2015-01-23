class CreateFlags < ActiveRecord::Migration
  def change
    create_table :flags do |t|
      t.text :reason
      t.references :reporter, index: true
      t.references :flagged, index: true

      t.timestamps
    end
  end
end
