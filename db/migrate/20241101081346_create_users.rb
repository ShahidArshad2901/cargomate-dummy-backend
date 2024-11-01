class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :frontegg_id, null: false
      t.string :email, null: false
      t.string :name
      t.json :metadata
      t.timestamps
    end

    add_index :users, :frontegg_id, unique: true
    add_index :users, :email, unique: true
  end
end
