class RecipeFood < ApplicationRecord
  belongs_to :recipe, class_name: 'NewRecipe'
  belongs_to :new_recipe
  belongs_to :food

  def food_name
    food&.name
  end

  def total_price
    quantity * food.price
  end
end
