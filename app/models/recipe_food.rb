class RecipeFood < ApplicationRecord
  belongs_to :new_recipe
  belongs_to :food
end
