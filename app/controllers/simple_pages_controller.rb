class SimplePagesController < ApplicationController

  def landing_page
    @products = Product.all
  end

  #Display random product
  def Product.random
    self.limit(1).offset(rand(self.count)).first
  end
  
end
