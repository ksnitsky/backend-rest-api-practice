json.id post.id
json.title post.title.capitalize
json.content post.content

json.category post.category, :id, :title

json.author post.user, :id, :username
json.rating post.rating

json.tags post.tags, :id, :title
json.comments post.commentaries do |commentary|
  json.id commentary.id
  json.text commentary.text
  json.user commentary.user.username
  json.created_at commentary.created_at
end

json.call(post, :created_at, :updated_at)
