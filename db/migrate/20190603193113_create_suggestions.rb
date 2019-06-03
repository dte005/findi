class CreateSuggestions < ActiveRecord::Migration[5.2]
  def change
    create_table :suggestions do |t|
      t.references :event, foreign_key: true
      t.string :title
      t.boolean :selected
      t.string :address

      t.timestamps
    end
  end
end
