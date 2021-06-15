json.content  @comment.content
json.user_id  @comment.user.id
json.user_name  @comment.user.username
json.created_at @comment.created_at.strftime("%Y-%m-%d %H:%M")
