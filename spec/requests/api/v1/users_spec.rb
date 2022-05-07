require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'POST /register' do
    it 'authenticates the user' do
      post api_v1_register_url, params: {
        user: { username: 'user1', password: 'password' }
      }
      expect(response).to have_http_status(:created)
      expect(json).to eq({
                           'id' => User.last.id,
                           'username' => 'user1'
                         })
    end
  end
end
