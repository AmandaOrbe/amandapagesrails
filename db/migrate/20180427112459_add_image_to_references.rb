class AddImageToReferences < ActiveRecord::Migration[5.1]
  def change
    add_column :references, :image, :string
  end
end
