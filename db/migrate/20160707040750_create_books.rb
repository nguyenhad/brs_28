class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.datetime :publish_date
      t.integer :pages
      t.references :category, index: true, foreign_key: true
      t.float :average_rate
      t.string :isbn
      t.string :description

      t.timestamps null: false
    end
  end
end
