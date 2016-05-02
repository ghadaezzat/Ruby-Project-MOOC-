class AddCustomDataToUsers < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :gender, "ENUM('male','female') "
    add_column :users, :birthdate, :date
  end
end
