class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :voter_id
      t.integer :hack_id
      t.integer :type
      t.integer :height
      t.integer :width

      t.timestamps
    end
  end
end
