class CreateArticles < ActiveRecord::Migration[5.1]
  def change
    create_table :articles do |t|
      t.string :title
      t.datetime :date
      t.string :author
      t.string :headlines
      t.string :url

      t.timestamps
    end
  end
end
