require 'database_connection'

describe DatabaseConnection do
  describe '.setup' do
    it 'sets up a connection' do
      expect(PG).to receive(:connect).with(dbname: 'bookmark_manager_test')

      DatabaseConnection.setup('bookmark_manager_test')
    end

    it 'this connection is persistent' do
      connection = DatabaseConnection.setup('bookmark_manager_test')

      expect(DatabaseConnection.connection).to eq connection
    end
  end
end
