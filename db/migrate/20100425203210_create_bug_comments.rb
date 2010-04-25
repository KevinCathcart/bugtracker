class CreateBugComments < ActiveRecord::Migration
  def self.up
    create_table :bug_comments do |t|
      t.text :content
      t.integer :creator_id
      t.integer :bug_id

      t.timestamps
    end
  end

  def self.down
    drop_table :bug_comments
  end
end
