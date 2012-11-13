class AddDepartmentColumnToVotes < ActiveRecord::Migration
  def change
    add_column :votes, :department, :string
  end
end
