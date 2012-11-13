class AddActiveHackColumnToHacks < ActiveRecord::Migration
  def change
    add_column :hacks, :active_hack, :boolean
  end
end
