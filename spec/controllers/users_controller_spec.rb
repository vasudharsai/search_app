require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  context "GET #index" do
    it "returns a success response" do
      get :index
      expect(response.status).to be 200
    end
  end


  context 'GET # index - with search params' do
    it "should return search results" do
      role = 'admin'
      get :index, params: {select_attribute:'role', q: role, commit: 'Search'}
      expect(assigns(:users).map(&:role).uniq).to eql [role]
    end
  end

end
