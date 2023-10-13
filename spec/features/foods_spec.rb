require 'rails_helper'

RSpec.feature 'Foods', type: :feature do
  before(:each) do
    Food.delete_all
    @user = User.create!(
      name: 'John',
      email: 'john@example.com',
      password: 'password',
      confirmed_at: Time.now
    )
    @food = Food.create!(
      name: 'Sample Food',
      measurement_unit: 'Grams',
      price: 5.67,
      quantity: 10,
      user: @user
    )
    visit new_user_session_path
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password
    click_button 'Log in'

    visit foods_path
  end
  scenario 'User should see the "Add new food" button' do
    expect(page).to have_link('Add new food', href: new_food_path)
  end
  scenario 'User should not see an "Add New Food" button in this page' do
    expect(page).to have_link('Add new food', href: new_food_path)
  end

  scenario 'User sees foods table to display only the "Food"' do
    expect(page).to have_content('Food')
  end
  scenario 'User sees unit table to display only the "Unit"' do
    expect(page).to have_content('Unit')
  end
  scenario 'User sees price table to display only the "Price"' do
    expect(page).to have_content('Price')
  end
  scenario 'User sees quantity to display only the "Quantity"' do
    expect(page).to have_content('Quantity')
  end
  scenario 'User sees action to display only the "Action"' do
    expect(page).to have_content('Action')
  end

  scenario 'User sees name food table to display only the "Grams"' do
    expect(page).to have_content('Grams')
  end
  scenario 'User sees food table to display only the "Sample Food"' do
    expect(page).to have_content('Sample Food')
  end
  scenario 'User sees food table to display only the "5.67 for the price"' do
    expect(page).to have_content('5.67')
  end
  scenario 'User sees food table to display only the "Quantity"' do
    expect(page).to have_content('10')
  end

  scenario 'User sees a delete button foods with options to view and delete' do
    expect(page).to have_button('Delete')
  end
  scenario 'that redirects to the "Add new Food"' do
    visit new_food_path
    expect(page).to have_current_path(new_food_path)
  end
end
