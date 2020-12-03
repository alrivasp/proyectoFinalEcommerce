class CreateConversations < ActiveRecord::Migration[5.2]
  def change
    create_table :conversations do |t|
      t.references :message, foreign_key: true
      t.integer :sender_id
      t.integer :received_id
      
      t.timestamps
    end
  end
end
