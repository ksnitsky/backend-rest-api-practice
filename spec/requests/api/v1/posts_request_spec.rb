require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  let!(:posts) { create_list(:post, 10) }
  let(:post_id) { posts.first.id }
  let(:user) { FactoryBot.create(:user, username: 'new_user', password: 'password') }
  let(:auth_token) { { 'Authorization' => AuthenticationTokenService.call(user.id) } }

  describe 'GET /posts' do
    before { get '/api/v1/posts' }

    it 'returns posts' do
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET /posts/:id' do
    before { get "/api/v1/posts/#{post_id}" }

    context 'when post does not exist' do
      let(:post_id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(:not_found)
      end

      it 'returns a not found message' do
        expect(response.body).to include("Couldn't find Post with 'id'=#{post_id}")
      end
    end
  end

  describe 'POST /posts' do
    let(:valid_attributes) do
      {
        title: 'There was never a genius without a tincture of madness.',
        content: 'Mollitia iure omnis. Fugit non amet. Fugiat natus cumque.',
        category_title: create(:category).title,
        tag_list: 'street, Godard, fingerstache, phlogiston'
      }
    end

    before { post '/api/v1/posts', params: valid_attributes, headers: auth_token }

    context 'when request attributes are valid' do
      it 'returns status code 201' do
        expect(response).to have_http_status(:created)
      end
    end

    context 'when an invalid request' do
      before { post '/api/v1/posts', params: {}, headers: auth_token }

      it 'returns status code 422' do
        expect(response).to have_http_status(:unprocessable_entity)
      end

      it 'returns a failure message' do
        expect(response.body).to include("can't be blank")
      end
    end
  end

  describe 'PUT /books/:id' do
    let(:valid_attributes) { { title: 'Updated title' } }

    before { put "/api/v1/posts/#{post_id}", params: valid_attributes, headers: auth_token }

    context 'when post exists' do
      it 'returns status code 204' do
        expect(response).to have_http_status(:no_content)
      end

      it 'updates the post' do
        updated_post = Post.find(post_id)
        expect(updated_post.title).to match(/Updated title/)
      end
    end

    context 'when the post does not exist' do
      let(:post_id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(:not_found)
      end

      it 'returns a not found message' do
        expect(response.body).to include("Couldn't find Post with 'id'=#{post_id}")
      end
    end
  end

  describe 'DELETE /books/:id' do
    before { delete "/api/v1/posts/#{post_id}", headers: auth_token }

    it 'returns status code 204' do
      expect(response).to have_http_status(:no_content)
    end
  end
end
