class ShoppingListController < ApplicationController
  def index
    recipe_foods = RecipeFood.where(new_recipe_id: params[:id])

    recipe_food_quantities = recipe_foods.group(:food_id).sum(:quantity)

    foods = Food.all

    @shopping_list = []

    foods.each do |food|
      missing_quantity = [recipe_food_quantities[food.id].to_i - food.quantity, 0].max

      if missing_quantity.positive?
        @shopping_list << {
          food: food,
          missing_quantity: missing_quantity
        }
      end
    end
  end
end
