class AddTypeColumnToVotes < ActiveRecord::Migration
  def change
    add_column :votes, :type, :integer
  end
end
