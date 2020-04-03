class CreateDirectMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :direct_messages do |t|
      t.integer :sender_id
      t.integer :reciever_id
      t.string :message

      t.timestamps
    end
  end
end
