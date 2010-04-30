class CreateBugSolutionTable < ActiveRecord::Migration
  def self.up
    create_table :bugs_solutions, :id => false do|t|
      t.references :bug
      t.references :solution
    end
  add_index :bugs_solutions, :bug_id
  add_index :bugs_solutions, :solution_id
  end
  

  def self.down
     drop_table :bugs_solutions
  end
end
