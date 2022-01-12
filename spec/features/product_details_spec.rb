require 'rails_helper'

RSpec.feature "visitor can navigate to Product Details", type: :feature, js: true do
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
  scenario "They see a product with its details when clicking on prodcut" do
    # ACT
    visit root_path
    page.first('article.product').find('header').click
   
    expect(page).to have_css 'article.product-detail'
    # DEBUG / VERIFY
    save_screenshot
  end
  

end
