require 'sqlite3'

module Rubbish
  class Connection
    def initialize(database = 'test.db')
      @database = SQLite3::Database.new(database, results_as_hash: true)
    end

    def query(query, params = [])
      prepare(query, params) do |statement|
        result_set(statement) do |row|
          yield(row) if block_given?
        end
      end
    end

    private

    def prepare(query, params = [])
      statement = @database.prepare(query)
      statement.bind_params(params)

      yield(statement) if block_given?
    end

    def result_set(statement)
      res = SQLite3::ResultSet.new(@database, statement)
      res.map { |row| yield(row) if block_given? }
    end
  end
end
