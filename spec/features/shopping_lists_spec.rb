require 'rails_helper'

RSpec.feature 'ShoppingLists', type: :feature do
  before(:each) do
    Food.delete_all
    @user = User.create!(
      name: 'John',
      email: 'john@example.com',
      password: 'password',
      confirmed_at: Time.now
    )
    # @food = Food.create!(
    #   name: 'Sample Food',
    #   measurement_unit: 'Grams',
    #   price: 5.67,
    #   quantity: 10,
    #   user: @user
    # )
    visit new_user_session_path
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password
    click_button 'Log in'

    visit shopping_list_path
  end

  scenario 'User sees General shopping to display only the "Shopping List"' do
    expect(page).to have_content('SHOPPING LIST')
  end
  scenario 'User sees General shopping to display only the "Amount of foods"' do
    expect(page).to have_content('Amount of food items to buy: 0')
  end
  scenario 'User sees General shopping to display only the "Total value of food needed: $0.00"' do
    expect(page).to have_content('Total value of food needed: $0.00')
  end
  scenario 'User sees Tables to "Food"' do
    expect(page).to have_content('Food')
  end
  scenario 'User sees Tables to "Quantity"' do
    expect(page).to have_content('Quantity')
  end
  scenario 'User sees Tables to "Price"' do
    expect(page).to have_content('Price')
  end
end
