class CreateReigns < ActiveRecord::Migration[5.0]
  def change
    create_table :reigns do |t|
      t.references :user, index: true
      t.datetime :finished
      t.integer :duration

      t.timestamps
    end
  end
end
