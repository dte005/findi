class CreateInvites < ActiveRecord::Migration[5.2]
  def change
    create_table :invites do |t|
      t.references :event, foreign_key: true
      t.references :user, foreign_key: true
      t.boolean :accepted
      t.text :message

      t.timestamps
    end
  end
end
