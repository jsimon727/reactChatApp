class CreateImageLinks < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.integer :width
      t.integer :height
      t.string  :link
    end
  end
end
