class CreateMaps < ActiveRecord::Migration
  def change
    create_table :maps do |t|
      t.references :engineer, index: true
      t.references :instrument, index: true
      t.references :operation, index: true
      t.references :status, index: true

      t.timestamps
    end
  end
end
