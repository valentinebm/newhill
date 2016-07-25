class CreateLengths < ActiveRecord::Migration[5.0]
  def change
    create_table :lengths do |t|
      t.references :reign, index: true
      t.integer :secs

      t.timestamps
    end
  end
end
