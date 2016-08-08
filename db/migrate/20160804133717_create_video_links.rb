class CreateVideoLinks < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.integer :length
      t.string :source
      t.string :link
    end
  end
end
