require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it 'should save successfuly when initialized with the right fields' do
      @category = Category.create(name: "cat1")
      @products = Product.new(name: 'name1', description: "bla bla", image: "image url", price_cents: 1200, quantity: 4, category_id: @category.id )
      expect(@products.save).to be(true)
    end  
    
    it 'should not save successfuly when initialized without name field' do
      @category = Category.create(name: "cat1")
      @products = Product.new(name: nil, description: "bla bla", image: "image url", price_cents: 1200, quantity: 4, category_id: @category.id )
      expect(@products.save).to be(false)
    end  

    it 'should not save successfuly when initialized without price field' do
      @category = Category.create(name: "cat1")
      @products = Product.new(name: 'name1', description: "bla bla", image: "image url", price_cents: nil, quantity: 4, category_id: @category.id )
      expect(@products.save).to be(false)
    end  

    it 'should not save successfuly when initialized without quantity field' do
      @category = Category.create(name: "cat1")
      @products = Product.new(name: 'name1', description: "bla bla", image: "image url", price_cents: 1200, quantity: nil, category_id: @category.id )
      expect(@products.save).to be(false)
    end  
    
    it 'should not save successfuly when initialized without category field' do
      @category = Category.create(name: "cat1")
      @products = Product.new(name: 'name1', description: "bla bla", image: "image url", price_cents: 1200, quantity: 4, category_id: nil)
      expect(@products.save).to be(false)
    end
  end
end