class AddGenColumnToVotes < ActiveRecord::Migration
  def change
    add_column :votes, :gen, :boolean
  end
end
