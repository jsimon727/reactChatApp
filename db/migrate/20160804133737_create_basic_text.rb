class CreateBasicText < ActiveRecord::Migration
  def change
    create_table :texts do |t|
      t.text :body
    end
  end
end
