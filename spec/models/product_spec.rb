require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it "is valid" do
      @product = Product.new
      @category = Category.new
      @category.name = 'Test'
      @product.name = 'Prod Test' 
      @product.price = 3_052.00
      @product.quantity = 2
      @product.category = @category
      expect(@product.valid?).to be true
    end

    it "confirms name presence" do
      @product = Product.new
      @product.name = nil # invalid state
      @product.valid?
      expect(@product.errors[:name]).to  include("can't be blank")
  
      @product.name = 'test' # valid state
      @product.valid? 
      expect(@product.errors[:name]).not_to  include("can't be blank")
    end

    it "confirms price presence" do
      @product = Product.new
      @product.price = nil # invalid state
      @product.valid?
      expect(@product.errors[:price]).to  include("is not a number")
  
      @product.price = 3_052.00 # valid state
      @product.valid? 
      expect(@product.errors[:price]).not_to  include("can't be blank")
    end
  
    it "confirms quantity amount" do
      @product = Product.new
      @product.quantity = nil # invalid state
      @product.valid?
      expect(@product.errors[:quantity]).to  include("can't be blank")
  
      @product.quantity = 2 # valid state
      @product.valid? 
      expect(@product.errors[:quantity]).not_to  include("can't be blank")
    end
  
    it "has category_id" do
      @category = Category.new
      @product = Product.new
      @product.category = nil # invalid state
      @product.valid?
      expect(@product.errors[:category]).to  include("can't be blank")

      @product.category = @category # valid state
      @product.valid? 
      expect(@product.errors[:category]).not_to  include("can't be blank")
    end
  end
end