class CreateEngineers < ActiveRecord::Migration
  def change
    create_table :engineers do |t|
      t.string :name
      t.references :service_center, index: true

      t.timestamps
    end
  end
end
