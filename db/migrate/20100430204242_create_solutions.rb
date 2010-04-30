class CreateSolutions < ActiveRecord::Migration
  def self.up
    create_table :solutions do |t|
      t.string :description
      t.string :see_also
      t.integer :status
      t.integer :duplicate_of_id
      t.integer :creator_id
      t.integer :product_id
      t.string :patch_link
      t.timestamps
    end
  end

  def self.down
    drop_table :solutions
  end
end
