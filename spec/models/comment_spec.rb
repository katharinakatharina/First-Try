require 'rails_helper'
 describe Comment do
  let(:user){ FactoryBot.create(:user) }
  let(:product){ Product.create!(name: "retro",price: 199.99)}
   it "is not valid without a product" do
    expect(Comment.new(rating: 3, user: user, body: "like bike!")).not_to be_valid
  end
   it "is not valid without a user" do
    expect(Comment.new(rating: 1, body: "like bike!", product: product)).not_to be_valid
  end
   it "is not valid without a body" do
    expect(Comment.new(rating: 1, user: user, product: product)).not_to be_valid
  end
   it "is not without rating" do
    expect(Comment.new(user: user, body: "like bike!", product: product)).not_to be_valid
  end
end
