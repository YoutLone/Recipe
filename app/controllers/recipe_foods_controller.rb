class RecipeFoodsController < ApplicationController
  def create
    @recipe = NewRecipe.find(params[:recipe_food][:new_recipe_id])

    @recipe_foods = RecipeFood.new(recipe_foods_params)
    @recipe_foods.recipe = @recipe

    respond_to do |format|
      format.html do
        if @recipe_foods.save
          redirect_to user_new_recipe_path(current_user, @recipe), notice: 'Ingredient saved successfully'
        else
          redirect_to user_recipe_path(current_user, @recipe.id), alert: 'Error, Ingredient not created!'
        end
      end
    end
  end

  def edit
    @recipe = NewRecipe.find(params[:recipe_id]) # Change here
    @recipe_food = RecipeFood.find(params[:id])
  end

  def update
    @recipe = NewRecipe.find(params[:new_recipe_id])
    @recipe_food = RecipeFood.find(params[:id])

    respond_to do |format|
      if @recipe_food.update(recipe_foods_params)
        format.html do
          redirect_to user_new_recipe_path(current_user, @recipe), notice: 'Ingredient updated successfully'
        end
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @recipe = NewRecipe.find(params[:recipe_id])
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
    params.require(:recipe_food).permit(:recipe_id, :food_id, :quantity, :new_recipe_id)
  end
end
