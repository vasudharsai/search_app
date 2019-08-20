require 'rails_helper'

RSpec.describe TicketsController, type: :controller do

  context "GET #index" do
    it "returns a success response" do
      get :index
      expect(response.status).to be 200
    end
  end


  context 'GET # index - with search params' do
    it "should return search results" do
      url = 'http://initech.zendesk.com/api/v2/tickets/c08537d2-116d-45ff-a6d0-60c1a7d4778f.json'
      get :index, params: {select_attribute:'url', q: url, commit: 'Search'}
      expect(assigns(:tickets).map(&:url).uniq).to eql [url] #
    end
  end

end
