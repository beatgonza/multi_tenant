class AddColorToAccounts < ActiveRecord::Migration
  def change
    add_column :accounts, :color, :string
  end
end
