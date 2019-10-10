require './lib/database_connection'
require 'pg'

if ENV['ENVIRONMENT'] == 'test'
  DatabaseConnection.setup(dbname: 'bookmark_manager_test')
else
  DatabaseConnection.setup(dbname: 'bookmark_manager')
end
