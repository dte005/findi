class AddCoordinatesToSuggestions < ActiveRecord::Migration[5.2]
  def change
    add_column :suggestions, :latitude, :float
    add_column :suggestions, :longitude, :float
  end
end
