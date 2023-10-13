require 'rails_helper'

RSpec.feature 'Welcome', type: :feature do
  scenario 'User sees welcome page after signing in' do
    user = User.create!(
      name: 'John',
      email: 'john@example.com',
      password: 'password',
      confirmed_at: Time.now
    )

    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'

    expect(page).to have_content('Welcome to the Recipe App')
    expect(page).to have_content('Explore delicious recipes and create your own culinary masterpieces.')
  end

  scenario 'User signs in and sees the "List of Recipes" button' do
    user = User.create!(
      name: 'John',
      email: 'john@example.com',
      password: 'password',
      confirmed_at: Time.now
    )

    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'

    expect(page).to have_link('List of Recipes')
  end
  scenario 'User signs in and sees the "Add New Foods" button' do
    user = User.create!(
      name: 'John',
      email: 'john@example.com',
      password: 'password',
      confirmed_at: Time.now
    )

    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'

    expect(page).to have_link('Add New Foods')
  end
  scenario 'User signs in and sees the "Public Recipes" button' do
    user = User.create!(
      name: 'John',
      email: 'john@example.com',
      password: 'password',
      confirmed_at: Time.now
    )

    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'

    expect(page).to have_link('Public Recipes')
  end
  scenario 'User signs in and sees the "Shopping List" button' do
    user = User.create!(
      name: 'John',
      email: 'john@example.com',
      password: 'password',
      confirmed_at: Time.now
    )

    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'

    expect(page).to have_link('Shopping List')
  end
  scenario 'User signs in and sees the "Logout" button' do
    user = User.create!(
      name: 'John',
      email: 'john@example.com',
      password: 'password',
      confirmed_at: Time.now
    )

    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'

    expect(page).to have_button('Logout')
  end
end
