class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :identifier
      t.string :nickname

      t.timestamps
    end
    add_index :users, :identifier
  end

  def self.down
    drop_table :users
  end
end
