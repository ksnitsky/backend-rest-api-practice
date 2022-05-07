json.id user.id
json.username user.username

json.posts user.posts do |post|
  json.id post.id
  json.title post.title
  json.rating post.rating
end

json.comments user.commentaries do |commentary|
  json.id commentary.id
  json.under_post commentary.post.title
  json.url api_v1_post_url(commentary.post, format: json)
end
