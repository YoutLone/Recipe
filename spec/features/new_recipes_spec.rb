require 'rails_helper'

RSpec.feature 'NewRecipes', type: :feature do
  let(:user) { User.create(name: 'John', email: 'user@example.com', password: 'password') }

  before do
    login_as(user, scope: :user)
  end

  scenario 'User creates a new recipe' do
    visit new_recipe_path

    fill_in 'Name', with: 'Test Recipe'
    fill_in 'Preparation time', with: 30
    fill_in 'Cooking time', with: 45
    fill_in 'Description', with: 'A delicious recipe'
    check 'Public'

    click_button 'Create New Recipe'

    expect(page).to have_content('New Recipe was successfully created')
  end

  scenario 'User updates a recipe' do
    recipe = NewRecipe.create(name: 'Test Recipe', preparation_time: 30, cooking_time: 45, description: 'A delicious recipe', public: true, user: user)

    visit edit_recipe_path(recipe)

    fill_in 'Name', with: 'Updated Recipe Name'
    click_button 'Update New Recipe'

    expect(page).to have_content('New Recipe was successfully updated')
  end

  scenario 'User views a recipe' do
    recipe = NewRecipe.create(name: 'Test Recipe', preparation_time: 30, cooking_time: 45, description: 'A delicious recipe', public: true, user: user)

    visit recipe_path(recipe)

    expect(page).to have_content('Test Recipe')
    expect(page).to have_content('Preparation Time: 30 minutes')
    expect(page).to have_content('Cooking Time: 45 minutes')
    expect(page).to have_content('Description: A delicious recipe')
  end
end
