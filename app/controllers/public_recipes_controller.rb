class PublicRecipesController < ApplicationController
  def index
    @public_recipes = NewRecipe.where(public: true)
  end
end
