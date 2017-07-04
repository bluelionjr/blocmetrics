require 'rails_helper'

RSpec.describe RegisteredApplicationsController, type: :controller do
  let(:test_app) { RegisteredApplication.create!(title: "Controller Test App", url: "http://www.controllertestapp.org", user_id: 2) }
  user = FactoryGirl.create(:user)

  describe "GET #index" do
    it "returns http success" do
      sign_in user
      get :index
      expect(response).to have_http_status(:success)
    end

    it "assigns [test_app] to @registered_applications" do
      sign_in user
      get :index
      expect(assigns(:registered_applications)).to eq([test_app])
    end
  end

  describe "GET #show" do
    it "returns http success" do
      sign_in user
      get :show, params: {id: test_app.id}
      expect(response).to have_http_status(:success)
    end

    it "renders the #show view" do
      sign_in user
      get :show, params: {id: test_app.id}
      expect(response).to render_template :show
    end

    it "assigns test_app to @registered_application" do
      sign_in user
      get :show, params: {id: test_app.id}
      expect(assigns(:registered_application)).to eq(test_app)
    end
  end

  describe "GET #new" do
    it "returns http success" do
      sign_in user
      get :new
      expect(response).to have_http_status(:success)
    end

    it "renders the #new view" do
      sign_in user
      get :new
      expect(response).to render_template :new
    end

    it "instantiates @registered_application" do
      sign_in user
      get :new
      expect(assigns(:registered_application)).not_to be_nil
    end
  end

  describe "POST create" do
    it "increases the number of RegisteredApplication by 1" do
      sign_in user
      expect{post :create, registered_application: {title: "Post test", url: "www.posttest.com", user_id: user.id}}.to change(RegisteredApplication, :count).by(1)
    end

    it "assigns the new registered_application to @registered_application" do
      sign_in user
      post :create, registered_application: {title: "Post test", url: "www.posttest.com", user_id: user.id}
      expect(assigns(:registered_application)).to eq RegisteredApplication.last
    end

    it "redirects to the new registered_application" do
      sign_in user
      post :create, registered_application: {title: "Post test", url: "www.posttest.com", user_id: user.id}
      expect(response).to redirect_to RegisteredApplication.last
    end
  end


  describe "GET #edit" do
    it "returns http success" do
      sign_in user
      get :edit, params: {id: test_app.id}
      expect(response).to have_http_status(:success)
    end

    it "renders the #edit view" do
      sign_in user
      get :edit, params: {id: test_app.id}
      expect(response).to render_template :edit
    end

    it "assigns registered_application to be updated to @registered_application" do
      sign_in user
      get :edit, params: {id: test_app.id}

      registered_application_instance = assigns(:registered_application)

      expect(registered_application_instance.id).to eq test_app.id
      expect(registered_application_instance.title).to eq test_app.title
      expect(registered_application_instance.url).to eq test_app.url
    end
  end

  describe "PUT update" do
    it "updates registered_application with expected attributes" do
      sign_in user
      new_title = "Changed to new title"
      new_url = "http://www.changedurl.io"

      put :update, id: test_app.id, registered_application: {title: new_title, url: new_url}

      updated_registered_application = assigns(:registered_application)
      expect(updated_registered_application.id).to eq test_app.id
      expect(updated_registered_application.title).to eq new_title
      expect(updated_registered_application.url).to eq new_url
    end

    it "redirects to the updated registered_application" do
      sign_in user
      new_title = "Changed to new title"
      new_url = "http://www.changedurl.io"

      put :update, id: test_app.id, registered_application: {title: new_title, url: new_url}
      expect(response).to redirect_to test_app
    end
  end

  describe "DELETE destroy" do
    it "deletes the registered_application" do
      sign_in user
      delete :destroy, params: {id: test_app.id}
      count = RegisteredApplication.where({id: test_app.id}).size
      expect(count).to eq 0
    end

    it "redirects to registered_applications index" do
      sign_in user
      delete :destroy, params: {id: test_app.id}
      expect(response).to redirect_to registered_applications_path
    end
  end
end
