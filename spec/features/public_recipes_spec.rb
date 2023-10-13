require 'rails_helper'

RSpec.feature 'PublicRecipes', type: :feature do
  before(:each) do
    NewRecipe.delete_all
    @user = User.create!(
      name: 'John',
      email: 'john@example.com',
      password: 'password',
      confirmed_at: Time.now
    )
    @recipe = NewRecipe.create!(
      name: 'Delicious Recipe',
      preparation_time: 30,
      cooking_time: 45,
      description: 'This is a tasty recipe.',
      public: true,
      user: @user
    )

    visit new_user_session_path
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password
    click_button 'Log in'

    visit public_recipes_path
  end
  scenario 'User sees Public when It is "Public Recipes"' do
    expect(page).to have_content('Public Recipes')
  end
  scenario 'User sees recipe table to display only the "Delicious Recipe"' do
    expect(page).to have_content('Delicious Recipe')
  end
  scenario 'that redirects to the "Create new Recipe"' do
    visit public_recipes_path
    expect(page).to have_current_path(public_recipes_path)
  end
end
