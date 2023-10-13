class NewRecipesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_recipe, only: %i[show edit update destroy]

  def index
    @recipes = NewRecipe.where(user_id: current_user.id)
  end

  def new
    @recipe = NewRecipe.new
  end

  def show
    @recipe = NewRecipe.find(params[:id])
    @recipe_foods = @recipe.recipe_foods # Load associated recipe_foods
  end

  def create
    @recipe = current_user.new_recipes.new(recipe_params)

    if @recipe.save
      redirect_to new_recipes_path, notice: 'The recipe was successfully created.'
    else
      render :new, alert: 'The recipe was not created.'
    end
  end

  def edit; end

  def update
    if @recipe.update(recipe_params)
      redirect_to recipe_path(@recipe), notice: 'The recipe was successfully updated.'
    else
      render :edit, alert: 'The recipe was not updated.'
    end
  end

  def make_public
    @recipe = NewRecipe.find(params[:id])
    @recipe.update(public: !@recipe.public)
    render json: { public: @recipe.public }
    head :no_content
  end

  def destroy
    @recipe = NewRecipe.find(params[:id])
    @recipe.destroy
    redirect_to user_new_recipes_path(current_user), notice: 'The recipe was successfully deleted.'
  end

  private

  def set_recipe
    @recipe = NewRecipe.find(params[:id])
  end

  def recipe_params
    params.require(:new_recipe).permit(:name, :preparation_time, :cooking_time, :description, :public, :user_id)
  end
end
