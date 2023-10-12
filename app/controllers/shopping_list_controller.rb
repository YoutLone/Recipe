class ShoppingListController < ApplicationController
  def index
    # @items = RecipeFood.where(recipe_id: params[:id])
    @items = RecipeFood.includes(:food, :new_recipe)
      .select('recipe_foods.*, foods.price * recipe_foods.quantity AS total_price')
      .joins(:food)
      .all

    @total_price = @items.sum(&:total_price)
  end
end
