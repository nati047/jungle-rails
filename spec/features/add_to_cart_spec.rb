require 'rails_helper'

RSpec.feature "AddToCarts", type: :feature, js: true do
  before :each do
    @category = Category.create! name: 'Apparel'

    2.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end
  scenario "cart updates when product added to cart" do
    # ACT
    visit root_path
    page.first('article.product').find('button.btn-primary').click
    result = page.has_content?(' My Cart (1)')
    
    expect(result).to be(true) 
    # DEBUG / VERIFY
    save_screenshot
  end
  
end
