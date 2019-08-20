require 'rails_helper'

RSpec.describe OrganizationsController, type: :controller do

  context "GET #index" do
    it "returns a success response" do
      get :index
      expect(response.status).to be 200
    end
  end


  context 'GET # index - with search params' do
    it "should return search results" do
      id = '7cd6b8d4-2999-4ff2-8cfd-44d05b449226'
      get :index, params: {select_attribute:'external_id', q: id, commit: 'Search'}
      expect(assigns(:organizations).map(&:external_id).uniq).to eql [id]
    end
  end

end
