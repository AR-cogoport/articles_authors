class CreateArticles < ActiveRecord::Migration[7.0]

  
  def change
    create_table :articles do |t|
      t.string :author
      t.string :title
      t.string :body
      t.string :category
      t.date   :date 
      t.timestamps
    end
  end
end
