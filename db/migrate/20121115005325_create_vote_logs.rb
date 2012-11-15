class CreateVoteLogs < ActiveRecord::Migration
  def change
    create_table :vote_logs do |t|
      t.integer :hack_id
      t.float :hack_score
      t.timestamp :logged_at
      t.integer :time_index

      t.timestamps
    end
  end
end
