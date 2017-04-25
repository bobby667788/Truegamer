class AddCategoryToProducts < ActiveRecord::Migration[5.0]
  def change
      category=Category.create!(name:"No Category")
    add_reference :products, :category, foreign_key: true, default:category.id
  end
end
