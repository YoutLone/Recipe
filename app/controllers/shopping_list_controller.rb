class ShoppingListController < ApplicationController
  def index
    @items = RecipeFood.where(recipe_id: params[:id])
  end
end
