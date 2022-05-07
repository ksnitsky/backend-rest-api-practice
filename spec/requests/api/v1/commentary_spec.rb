require 'rails_helper'

RSpec.describe 'Api::V1::Commentaries', type: :request do
  let(:test_post) { create(:post) }
  let(:auth_token) { { 'Authorization' => AuthenticationTokenService.call(test_post.user.id) } }
  let(:api_v1_commentary_url) { "#{api_v1_posts_url}/#{test_post.id}/commentary/" }

  describe 'POST /posts/:post_id/commentary/' do
    context 'when request attributes are valid' do
      before do
        post api_v1_commentary_url,
             params: { text: 'Comment body' },
             headers: auth_token
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(:created)
      end
    end

    context 'when an invalid request' do
      before { post api_v1_commentary_url, params: {}, headers: auth_token }

      it 'returns status code 422' do
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  # describe 'PATCH /commentary/:id' do
  #
  # end

  # describe 'DELETE /destroy' do
  #   it 'returns http success' do
  #     get '/api/v1/commentary/destroy'
  #     expect(response).to have_http_status(:success)
  #   end
  # end
end
