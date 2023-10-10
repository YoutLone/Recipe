require 'rails_helper'

RSpec.describe NewRecipe, type: :model do
  it 'is valid with a valid attributes' do
    user = User.new(name: 'jalloh', email: 'jalloh@example.com', password: 'password')
    recipe = NewRecipe.new(name: 'Chicken', preparation_time: 30, cooking_time: 45, description: 'Delicious',
                           public: true, user:)
    expect(recipe).to be_valid
  end
  it 'is not valid without a name' do
    recipe = NewRecipe.new(preparation_time: 30, cooking_time: 45, description: 'Delicious curry recipe.', public: true)
    expect(recipe).to_not be_valid
  end

  it 'is not valid without a user' do
    recipe = NewRecipe.new(name: 'Chicken Curry', preparation_time: 30, cooking_time: 45,
                           description: 'Delicious curry recipe.', public: true)
    expect(recipe).to_not be_valid
  end
  it 'is not valid without preparation_time' do
    user = User.new(name: 'jalloh', email: 'jalloh@example.com', password: 'password')
    recipe = NewRecipe.new(name: 'Chicken', cooking_time: 45, description: 'Delicious', public: true, user:)
    expect(recipe).to_not be_valid
  end

  it 'is not valid without cooking_time' do
    user = User.new(name: 'jalloh', email: 'jalloh@example.com', password: 'password')
    recipe = NewRecipe.new(name: 'Chicken', preparation_time: 30, description: 'Delicious', public: true, user:)
    expect(recipe).to_not be_valid
  end

  it 'is not valid without description' do
    user = User.new(name: 'jalloh', email: 'jalloh@example.com', password: 'password')
    recipe = NewRecipe.new(name: 'Chicken', preparation_time: 30, cooking_time: 45, public: true, user:)
    expect(recipe).to_not be_valid
  end

  it "is not valid without a boolean value for 'public'" do
    user = User.new(name: 'jalloh', email: 'jalloh@example.com', password: 'password')
    recipe = NewRecipe.new(name: 'Chicken', preparation_time: 30, cooking_time: 45, description: 'Delicious',
                           user:)
    expect(recipe).to_not be_valid
  end

  it 'is not valid with a negative preparation_time' do
    user = User.new(name: 'jalloh', email: 'jalloh@example.com', password: 'password')
    recipe = NewRecipe.new(name: 'Chicken', preparation_time: -10, cooking_time: 45, description: 'Delicious',
                           public: true, user:)
    expect(recipe).to_not be_valid
  end

  it 'is not valid with a negative cooking_time' do
    user = User.new(name: 'jalloh', email: 'jalloh@example.com', password: 'password')
    recipe = NewRecipe.new(name: 'Chicken', preparation_time: 30, cooking_time: -10, description: 'Delicious',
                           public: true, user:)
    expect(recipe).to_not be_valid
  end
end
