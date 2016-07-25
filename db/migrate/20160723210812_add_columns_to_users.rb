class AddColumnsToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :provider, :string
    add_column :users, :uid, :string
    add_column :users, :email, :string
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :password, :string
    add_column :users, :age_range, :string
    add_column :users, :link, :string
    add_column :users, :picture, :string
    add_column :users, :locale, :string
    add_column :users, :gender, :string
    add_column :users, :total_reign, :integer
  end
end
