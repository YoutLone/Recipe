class RecipeFood < ApplicationRecord
  belongs_to :recipe, class_name: 'NewRecipe'
  belongs_to :food
end
