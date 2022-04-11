require 'rails_helper'

RSpec.describe Product, type: :model do

  describe 'Validations' do

    before do
      @category = Category.new(name: 'Electronics')
      @category.save
    end
    # validation tests/examples here
    it 'creates a product with all four fields set' do
      @product = @category.products.create!(name: 'Mouse', price: 25, quantity: 2, category: @category)

      expect(@product).to be_valid
    end    

    it 'throws an error if there is no name for the product' do
      @product = @category.products.new(name: nil, price: 25, quantity: 2, category: @category)
      @product.save

      expect(@product.errors.full_messages).to include("Name can't be blank")
    end   

    it 'throws an error if there is no price for the product' do
      @product = @category.products.new(name: 'Mouse', price: nil, quantity: 2, category: @category)
      @product.save

      expect(@product.errors.full_messages).to include("Price can't be blank")
    end   

    it 'throws an error if there is no quantity for the product' do
      @product = @category.products.new(name: 'Mouse', price: 25, quantity: nil, category: @category)
      @product.save

      expect(@product.errors.full_messages).to include("Quantity can't be blank")
    end    

    it 'throws an error if there is no category for the product' do
      @product = Product.new(name: 'Mouse', price: 25, quantity: 2)
      @product.save

      expect(@product.errors.full_messages).to include("Category can't be blank")
    end    

  end

end
