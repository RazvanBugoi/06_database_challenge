require 'posts_repository'
# file: spec/posts_repository_spec.rb

def reset_posts_table
	seed_sql = File.read('spec/seeds.sql')
	connection = PG.connect({ host: '127.0.0.1', dbname: 'social_network_test' })
	connection.exec(seed_sql)
end

describe PostRepository do
	before(:each) do 
	reset_posts_table
end

	# (your tests will go here).
	context '#all' do
		it 'returns all posts' do
			repo = PostRepository.new

			all_posts = repo.all

			expect(all_posts.length).to eq  3
			expect(all_posts[0].title).to eq 'My first post'
			expect(all_posts[0].content).to eq 'something'
			expect(all_posts[0].views).to eq "4"
			expect(all_posts[0].user_id).to eq "1"
		end

		it 'returns all posts' do
			repo = PostRepository.new

			all_posts = repo.all

			expect(all_posts.length).to eq  3
			expect(all_posts[1].title).to eq 'Another post'
			expect(all_posts[1].content).to eq 'something else'
			expect(all_posts[1].views).to eq "5"
			expect(all_posts[1].user_id).to eq "1"
		end
	end

	context '#find' do
		it 'returns a single Post object' do
			repo = PostRepository.new

			single_post = repo.find(1)

			expect(single_post.title).to eq 'My first post'
			expect(single_post.content).to eq 'something'
			expect(single_post.views).to eq '4'
			expect(single_post.user_id).to eq '1'
		end
	end

	context '#create' do
		it 'creates a single Post object' do
			repo = PostRepository.new

			new_post = Post.new
			new_post.title = 'Test post'
			new_post.content = 'implemented with create method'
			new_post.views = '6'
			new_post.user_id = '2'
			
			repo.create(new_post)
			results = repo.all

			expect(results.length).to eq 4
			expect(results.last.title).to eq 'Test post'
			expect(results.last.content).to eq 'implemented with create method'
			expect(results.last.views).to eq '6'
		end
	end

	context '#delete' do
		it 'delets a single Post object' do
			new_instance = PostRepository.new
			
			new_instance.delete(1)
			repo = new_instance.all
			
			expect(repo.length).to eq 2
			expect(repo.first.title).to eq 'Another post'
			expect(repo.first.content).to eq 'something else'
			expect(repo.first.views).to eq '5'
		end
	end
end