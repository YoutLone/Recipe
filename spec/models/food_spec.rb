require 'rails_helper'

RSpec.describe Food, type: :model do
  it 'is valid with valid attributes' do
    user = User.create(email: 'test@example.com', password: 'password')
    food = Food.new(name: 'Test Food', measurement_unit: 'grams', price: 5.99, quantity: 10, user:)
    expect(food).to be_valid
  end

  it 'is not valid without a name' do
    food = Food.new(measurement_unit: 'grams', price: 5.99, quantity: 10)
    expect(food).to_not be_valid
  end
  it 'is not valid without a measurement_unit' do
    food = Food.new(name: 'Test food', price: 5.99, quantity: 10)
    expect(food).to_not be_valid
  end
  it 'is not valid without a price' do
    food = Food.new(name: 'Test food', measurement_unit: 'grams', quantity: 10)
    expect(food).to_not be_valid
  end
  it 'is not valid without a quantity' do
    food = Food.new(name: 'Test food', measurement_unit: 'grams', price: 5.99)
    expect(food).to_not be_valid
  end
end
