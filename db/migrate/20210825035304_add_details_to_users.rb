class AddDetailsToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :introduction, :text
    add_column :users, :avatar_name, :string
  end
end
