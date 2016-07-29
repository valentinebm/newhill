class AddWeaponToReigns < ActiveRecord::Migration[5.0]
  def change
    add_column :reigns, :weapon, :string
  end
end
