json.call(user, :id, :email, :username)

json.posts user.posts, partial: 'api/v1/posts/post', as: :post
