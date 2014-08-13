class CreateInstruments < ActiveRecord::Migration
  def change
    create_table :instruments do |t|
      t.string :name
      t.references :maker, index: true

      t.timestamps
    end
  end
end
