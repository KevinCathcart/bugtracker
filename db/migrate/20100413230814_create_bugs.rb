class CreateBugs < ActiveRecord::Migration
  def self.up
    create_table :bugs do |t|
      t.string :description
      t.string :see_also
      t.integer :status
      t.integer :severity
      t.integer :priority
      t.integer :duplicate_of_id
      t.integer :creator_id
      t.integer :product_id

      t.timestamps
    end
  end

  def self.down
    drop_table :bugs
  end
end
