class CreateChatrooms < ActiveRecord::Migration[5.2]
  def change
    create_table :chatrooms do |t|
      t.string :name, null: false, unique: true

      t.timestamps null: false
    end
  end
end
