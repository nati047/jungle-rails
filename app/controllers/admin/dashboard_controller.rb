class Admin::DashboardController < ApplicationController
  # http_basic_authenticate_with name: ENV['ADMIN_NAME'], password: ENV['ADMIN_PASSWORD']
  def show
    @products = Product.count
    @categories = Category.count  # query not working
  end
end
