class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.references :activity, index: true

      t.timestamps
    end
  end
end
