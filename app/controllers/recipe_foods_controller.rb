class RecipeFoodsController < ApplicationController
  def create
    @recipe = Recipe.find(params[:recipe_id])

    @recipe_foods = RecipeFood.new(recipe_foods_params)
    @recipe_foods.recipe = @recipe

    respond_to do |format|
      format.html do
        if @recipe_foods.save
          redirect_to user_recipe_path(current_user, @recipe.id), notice: 'Ingredient saved successfully'
        else
          redirect_to user_recipe_path(current_user, @recipe.id), alert: 'Error, Ingredient not created!'
        end
      end
    end
  end

  def destroy
    @recipe = Recipe.find(params[:recipe_id])
    @recipe_food = RecipeFood.includes(:recipe, :food).find(params[:id])
    @recipe_food.delete

    respond_to do |format|
      format.html do
        redirect_to user_recipe_path(current_user, @recipe.id), notice: 'Ingredient deleted successfully'
      end
    end
  end

  private

  def recipe_foods_params
    params
      .require(:recipe_food)
      .permit(:food_id, :quantity)
  end
end
