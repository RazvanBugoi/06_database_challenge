require 'posts'

class PostRepository

  # Selecting all records
  # No arguments
	def all
    posts = []
    sql = 'SELECT id, title, content, views, user_id FROM posts;'
    result_set = DatabaseConnection.exec_params(sql, [])
    result_set.each do |record|
        post = Post.new
        post.id = record['id']
        post.title = record['title']
        post.content = record['content']
        post.views = record['views']
        post.user_id = record['user_id']
        posts << post
    end
	return posts
	end

  # Gets a single record by its ID
  # One argument: the id (number)
	def find(id)
		sql = 'SELECT id, title, content, views, user_id FROM posts WHERE id = $1;'
		sql_params = [id]

		result_set = DatabaseConnection.exec_params(sql, sql_params)
				record = result_set[0]

				post = Post.new
				post.id = record['id']
				post.title = record['title']
				post.content = record['content']
				post.views = record['views']
				post.user_id = record['user_id']
				return post
	end

  # Add more methods below for each operation you'd like to implement.

	def create(post)
    sql = 'INSERT INTO posts (title, content, views, user_id) VALUES ($1, $2, $3, $4);'
    sql_params = [post.title, post.content, post.views, post.user_id]
    DatabaseConnection.exec_params(sql, sql_params)
    return nil
	end

  # def update(post)
  # end

	def delete(id)
    sql = 'DELETE FROM posts WHERE id = $1'
    sql_params = [id]
    DatabaseConnection.exec_params(sql, sql_params)
    return nil
  end
end