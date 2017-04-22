require 'rails_helper'

RSpec.describe AdvertismentsController, type: :controller do

  let(:my_advertisment) { Advertisment.create!(title: RandomData.random_sentence, body: RandomData.random_paragraph, price: 101.00) }

    describe "GET #index" do
      it "returns http success" do
        get :index
        expect(response).to have_http_status(:success)
      end
      it "assigns [my_advertisment] to @advertisments" do
         get :index

         expect(assigns(:advertisments)).to eq([my_advertisment])
       end
    end


    describe "GET show" do
         it "returns http success" do

           get :show, {id: my_advertisment.id}
           expect(response).to have_http_status(:success)
         end
         it "renders the #show view" do

           get :show, {id: my_advertisment.id}
           expect(response).to render_template :show
         end

         it "assigns my_advertisment to @advertisment" do
           get :show, {id: my_advertisment.id}

           expect(assigns(:advertisment)).to eq(my_advertisment)
         end
       end


  describe "GET new" do
       it "returns http success" do
         get :new
         expect(response).to have_http_status(:success)
       end

       it "renders the #new view" do
         get :new
         expect(response).to render_template :new
       end

       it "instantiates @advertisment" do
         get :new
         expect(assigns(:advertisment)).not_to be_nil
       end
     end

     describe "POST create" do

       it "increases the number of Advertisment by 1" do
         expect{post :create, advertisment: {title: RandomData.random_sentence, body: RandomData.random_paragraph, price: 101}}.to change(Advertisment,:count).by(1)
       end

       it "assigns the new advertisment to @advertisment" do
         post :create, advertisment: {title: RandomData.random_sentence, body: RandomData.random_paragraph, price: 101}
         expect(assigns(:advertisment)).to eq Advertisment.last
       end

  # #6
       it "redirects to the new advertisment" do
         post :create, advertisment: {title: RandomData.random_sentence, body: RandomData.random_paragraph, price: 101}
         expect(response).to redirect_to Advertisment.last
       end
     end

end
