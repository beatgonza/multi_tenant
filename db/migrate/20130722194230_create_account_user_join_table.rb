class CreateAccountUserJoinTable < ActiveRecord::Migration
  def up
    create_table :accounts_users, :id => false do |t|
      t.references :account
      t.references :user
    end
    add_index :accounts_users, :account_id
    add_index :accounts_users, :user_id
  end

  def down
    drop_table :accounts_users
  end
end
