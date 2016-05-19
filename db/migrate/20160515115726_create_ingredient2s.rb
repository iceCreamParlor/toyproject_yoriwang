class CreateIngredient2s < ActiveRecord::Migration
  def change
    create_table :ingredient2s do |t|
      t.integer :recipe_id

      t.timestamps null: false
    end
  end
end
