class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
    t.string :name, null: false
    t.string :email, null: false

    end
    # add_index :users, :name
  end
end
