require 'rails_helper'

RSpec.describe PostController, type: :request do
  describe 'GET /index' do
    it 'returns a success response' do
      get '/user/1/post'
      
    end

    it 'renders the index template of views/users' do
      get '/user/1/post'
      
    end

      it 'renders the show template' do
        get '/user/1/post'
      end
end
end
