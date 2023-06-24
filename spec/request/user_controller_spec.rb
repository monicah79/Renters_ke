require 'rails_helper'

RSpec.describe UserController, type: :request do
  before do
    User.create(id: 1, name: 'John Doe', email: 'john.doe@example.com')
  end

    it 'renders the index template of views/users' do
      get '/user/'
   
  end

  describe 'GET #show' do
    it 'returns a success response' do
      get '/user/'
    end

    it 'renders the show template' do
      get '/user/1'
      
    end
  end
end
