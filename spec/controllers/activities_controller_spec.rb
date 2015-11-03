require 'rails_helper'

RSpec.describe ActivitiesController, :type => :controller do

  let(:valid_attributes) {
    {
      amount: 123.34,
      points: 123
    }
  }

  let(:invalid_attributes) {
    { points: nil}
  }

  let(:valid_session) { {} }

  before :each do
    @current_user = create(:user)
    login_with @current_user
  end

  describe "GET index" do
    it "assigns all activities as @activities" do
      activity = @current_user.activities.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:activities)).to eq([activity])
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Activity" do
        expect {
          post :create, {:activity => valid_attributes}, valid_session
        }.to change(Activity, :count).by(1)
      end

      it "assigns a newly created activity as @activity" do
        post :create, {:activity => valid_attributes}, valid_session
        expect(assigns(:activity)).to be_a(Activity)
        expect(assigns(:activity)).to be_persisted
      end

      it "redirects to the activities path" do
        post :create, {:activity => valid_attributes}, valid_session
        expect(response).to redirect_to(activities_path)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved activity as @activity" do
        post :create, {:activity => invalid_attributes}, valid_session
        expect(assigns(:activity)).to be_a_new(Activity)
      end

      it "re-renders the 'new' template" do
        post :create, {:activity => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "GET new" do
    it "assigns a new activity as @activity" do
      get :new, {}, valid_session
      expect(assigns(:activity)).to be_a_new(Activity)
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested activity" do
      activity = @current_user.activities.create! valid_attributes
      expect {
        delete :destroy, {:id => activity.to_param}, valid_session
      }.to change(Activity, :count).by(-1)
    end

    it "redirects to the activities list" do
      activity = @current_user.activities.create! valid_attributes
      delete :destroy, {:id => activity.to_param}, valid_session
      expect(response).to redirect_to(activities_url)
    end
  end

end
