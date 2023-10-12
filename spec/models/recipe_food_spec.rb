require 'rails_helper'

RSpec.describe RecipeFood, type: :model do
  let(:user) { User.create(name: 'John', email: 'test@example.com', password: 'password') }

  before do
    @user = User.create(name: 'John', email: 'user@example.com', password: 'password')

    @food = Food.create(name: 'Test Food', measurement_unit: 'grams', price: 5.99, quantity: 10, user: @user)

    @recipe = NewRecipe.create(name: 'Test Recipe', preparation_time: 30, cooking_time: 45, description: 'A delicious recipe', public: true, user: @user)
  end

  let(:recipe_food) { RecipeFood.new(food: @food, new_recipe: @recipe, quantity: 2) }

  it 'is not valid without a valid attributes' do
    expect(recipe_food).to_not be_valid
  end

  it 'is not valid without a food' do
    recipe_food.food = nil
    expect(recipe_food).to_not be_valid
  end

  it 'calculates the total price correctly' do
    expect(recipe_food.total_price).to eq(2 * @food.price)
  end

  it 'returns the food name' do
    expect(recipe_food.food_name).to eq(@food.name)
  end
end
