class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :title
      t.text :recipe
      t.text :img_url
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
