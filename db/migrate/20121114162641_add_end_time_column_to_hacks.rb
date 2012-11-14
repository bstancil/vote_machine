class AddEndTimeColumnToHacks < ActiveRecord::Migration
  def change
    add_column :hacks, :end_time, :timestamp
  end
end
