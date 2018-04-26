class CreateReferences < ActiveRecord::Migration[5.1]
  def change
    create_table :references do |t|
      t.string :url
      t.string :category
      t.string :title
      t.string :description
      t.string :notes
      t.boolean :used

      t.timestamps
    end
  end
end
