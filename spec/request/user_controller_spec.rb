require 'rails_helper'

RSpec.describe UserController, type: :request do
  before do
    User.create(id: 1, name: 'John Doe', email: 'john.doe@example.com')
  end

  describe 'GET /index' do
    it 'returns a success response' do
      get '/user/'
      expect(response).to be_successful
    end

    it 'renders the index template of views/users' do
      get '/user/'
      expect(response).to render_template(:index)
    end
  end

  describe 'GET #show' do
    it 'returns a success response' do
      get '/user/'
      expect(response).to have_http_status(200)
    end

    it 'renders the show template' do
      get '/user/1'
      expect(response).to render_template(:show)
    end
  end
end
