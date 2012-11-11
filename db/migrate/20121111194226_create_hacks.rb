class CreateHacks < ActiveRecord::Migration
  def change
    create_table :hacks do |t|
      t.string :title
      t.text :hackers
      t.boolean :gen

      t.timestamps
    end
  end
end
