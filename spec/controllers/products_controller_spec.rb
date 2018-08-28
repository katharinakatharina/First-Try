require 'rails_helper'
describe ProductsController, type: :controller do

  before do
     @user = FactoryBot.create(:user)
     @admin = FactoryBot.create(:admin)
     @product = FactoryBot.create(:product)
  end

  #GET index action
  describe 'GET #index' do
     it 'renders index page' do
       get :index
       expect(response).to be_ok
       expect(response).to render_template('index')
     end
  end

  #GET show
  describe 'GET #show' do
    it 'renders the show template' do
      get :show, params: { id: @product.id }
      expect(response.status).to eq 200
      expect(response).to render_template('show')
    end

    it 'shows the product' do
      get :show, params: { id: @product.id }
      expect(response.status).to eq 200
      expect(assigns(:product)).to eq @product
    end
  end

 #GET new
 describe 'GET #new' do
    context 'admin logged in' do
      before do
        sign_in @admin
      end
      it 'renders the new template' do
        get :new
        expect(response).to render_template :new
      end
    end

  #POST create
  describe 'POST #create' do
    before do
      sign_in @admin
    end

    it 'creates a new product' do
      expect(response).to be_successful
    end

    it 'does not create a new product' do
      expect(Product.new(name:nil)).not_to be_valid
    end
  end

  #gET edit
  describe 'GET #edit' do
    before do
      sign_in @admin
    end
    it 'renders the show template' do
      get :edit, params: { id: @product.id }
      expect(response).to be_ok
      expect(response).to render_template('edit')
    end
  end

  #DELETE destroy
  describe 'DELETE #destroy' do
    before do
      sign_in @admin
    end
    it 'delete the product' do
      delete :destroy, params: {id: @product.id }
      expect(response).to redirect_to products_path
    end
  end
end
end
