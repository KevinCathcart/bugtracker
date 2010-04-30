class CreateSolutionComments < ActiveRecord::Migration
  def self.up
    create_table :solution_comments do |t|
      t.text :content
      t.integer :creator_id
      t.integer :solution_id

      t.timestamps
    end
  end

  def self.down
    drop_table :solution_comments
  end
end
