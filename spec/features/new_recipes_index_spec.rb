require 'rails_helper'

RSpec.feature 'NewRecipe index', type: :feature do
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

    visit user_new_recipes_path(@user)
  end

  scenario 'User sees the "Create new Recipe" button' do
    expect(page).to have_link('Create new Recipe', href: new_user_new_recipe_path(@user))
  end
  scenario 'User Should not see a "Create New Recipe" button' do
    expect(page).to_not have_link('Create New Recipe', href: new_user_new_recipe_path(@user))
  end

  scenario 'User sees a name recipe with options to view and delete' do
    expect(page).to have_content('Delicious Recipe')
  end
  scenario 'User sees a remove button recipe with options to view and delete' do
    expect(page).to have_button('Remove')
  end
  scenario 'User sees a description recipe' do
    expect(page).to have_content('This is a tasty recipe.')
  end
  scenario 'that redirects to the "Create new Recipe"' do
    visit new_user_new_recipe_path(@user)
    expect(page).to have_current_path(new_user_new_recipe_path(@user))
  end
end
