class PublicRecipesController < ApplicationController
  def index
    @users = User.all
    @recipes = Recipe.includes([:user]).where(public: true)
  end
end
