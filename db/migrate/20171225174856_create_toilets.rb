class CreateToilets < ActiveRecord::Migration[5.1]
  def change
    create_table :toilets do |t|
      t.string :name
      t.text :description
      t.string :toilet_type

      t.timestamps
    end
  end
end
