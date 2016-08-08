class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.references :messageable, polymorphic: true, index: true
      t.integer :messageable_id
      t.string  :messageable_type
      t.integer :sender_id
      t.integer :recipient_id
    end
  end
end
