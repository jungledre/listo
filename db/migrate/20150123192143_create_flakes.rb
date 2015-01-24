class CreateFlakes < ActiveRecord::Migration
  def change
    create_table :flakes do |t|
      t.references :event, index: true
      t.references :nark, index: true
      t.references :flaked, index: true

      t.timestamps
    end
  end
end
