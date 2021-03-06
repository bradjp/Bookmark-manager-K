require 'database_helpers'
require 'user'

describe User do
  describe '#create' do
    it 'creates a new user' do
      user = User.create(email: 'chunkylover53@aol.com', password: 'Marge')
      persisted_data = persisted_data(table: 'users', id: user.id)

      expect(user).to be_a User
      expect(user.id).to eq persisted_data.first['id']
      expect(user.email).to eq 'chunkylover53@aol.com'
    end
  end

  describe '#find' do
    it 'finds a user' do
      user = User.create(email: 'chunkylover53@aol.com', password: 'Marge')
      result = User.find(id: user.id)

      expect(result.id).to eq user.id
      expect(result.email).to eq user.email
    end
    it 'returns nil if no ID is given' do
      expect(User.find(id: nil)).to eq nil
    end
  end
  end
