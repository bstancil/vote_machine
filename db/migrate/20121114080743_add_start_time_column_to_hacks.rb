class AddStartTimeColumnToHacks < ActiveRecord::Migration
  def change
    add_column :hacks, :start_time, :timestamp
  end
end
