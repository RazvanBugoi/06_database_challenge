require 'user_repository'

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
		it 'returns all users' do
			repo = UserRepository.new

			all_users = repo.all

			expect(all_users.length).to eq  2
			expect(all_users[0].email).to eq 'asd@gmail.com'
			expect(all_users[0].username).to eq 'razvanbugoi'
		end

		it 'returns all users' do
			repo = UserRepository.new

			all_users = repo.all

			expect(all_users.length).to eq  2
			expect(all_users[1].email).to eq 'raz@gmail.com'
			expect(all_users[1].username).to eq 'razvan'
		end
	end

	context '#find' do
		it 'returns a single User object' do
			repo = UserRepository.new

			single_user = repo.find(1)

			expect(single_user.email).to eq 'asd@gmail.com'
			expect(single_user.username).to eq 'razvanbugoi'
		end
	end

	context '#create' do
		it 'creates a single User object' do
			repo = UserRepository.new

			new_user = User.new
			new_user.email = 'helloworld@gmail.com'
			new_user.username = 'ruby'
			
			repo.create(new_user)
			results = repo.all

			expect(results.length).to eq 3
			expect(results.last.email).to eq 'helloworld@gmail.com'
			expect(results.last.username).to eq 'ruby'
		end
	end

	context '#delete' do
		it 'delets a single User object' do
			new_instance = UserRepository.new
			
			new_instance.delete(1)
			repo = new_instance.all
			
			expect(repo.length).to eq 1
			expect(repo.first.email).to eq 'raz@gmail.com'
			expect(repo.first.username).to eq 'razvan'
		end
	end
end