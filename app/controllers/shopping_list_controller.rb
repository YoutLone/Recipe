class ShoppingListController < ApplicationController
  def index
    # Get all recipe foods including associated food items and their quantities
    @recipe_foods = RecipeFood.includes(:food, :new_recipe)
      .select('recipe_foods.*, foods.price * recipe_foods.quantity AS total_price')
      .joins(:food)
      .all

    # Calculate the total quantity of each food item needed for the recipe
    @recipe_quantities = Hash.new(0)
    @recipe_foods.each do |item|
      @recipe_quantities[item.food_id] += item.quantity
    end

    # Get existing quantities of items from the inventory
    @inventory_quantities = Hash.new(0)
    Food.pluck(:id, :quantity).each do |food_id, quantity|
      @inventory_quantities[food_id] = quantity
    end

    # Calculate the additional quantities needed for the recipe
    @shopping_list = {}
    @recipe_quantities.each do |food_id, quantity|
      existing_quantity = @inventory_quantities[food_id]
      additional_quantity_needed = [0, quantity - existing_quantity].max
      @shopping_list[food_id] = additional_quantity_needed if additional_quantity_needed.positive?
    end

    # Calculate total price of all items in the shopping list
    @total_price = @shopping_list.sum { |food_id, quantity| quantity * Food.find(food_id).price }
  end
end
