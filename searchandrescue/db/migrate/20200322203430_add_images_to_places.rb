class AddImagesToPlaces < ActiveRecord::Migration[5.0]
  def change
    add_column :places, :images, :string
  end
end
