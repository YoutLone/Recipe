require 'rails_helper'

RSpec.describe User, type: :model do
  it 'is valid with a valid attributes' do
    user = User.new(name: 'Jalloh', email: 'jalloh@gmail.com', password: 'jalloh224')
    expect(user).to be_valid
  end

  it 'is not valid without a name' do
    user = User.new(email: 'john@example.com', password: 'password')
    expect(user).to_not be_valid
  end
  it 'is not valid without an email' do
    user = User.new(name: 'john', password: 'password')
    expect(user).to_not be_valid
  end
  it 'is not valid without a password' do
    user = User.new(name: 'john', email: 'john@example.com')
    expect(user).to_not be_valid
  end
  it 'is not valid with a duplicate email' do
    # Create a user with a specific email
    User.create(name: 'John', email: 'john@example.com', password: 'password')

    # Attempt to create another user with the same email
    user = User.new(name: 'Alice', email: 'john@example.com', password: 'another_password')
    expect(user).to_not be_valid
  end

  it 'is not valid with a short password' do
    user = User.new(name: 'Jane', email: 'jane@example.com', password: 'short')
    expect(user).to_not be_valid
  end

  it 'is not valid with an invalid email format' do
    user = User.new(name: 'David', email: 'invalid_email', password: 'password')
    expect(user).to_not be_valid
  end
end
