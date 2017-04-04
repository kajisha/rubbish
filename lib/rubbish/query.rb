module Rubbish
  module Query
    extend ActiveSupport::Concern

    class_methods do
      def where(params = {})
        # FIXME
        @where_clause = []

        @where_clause << params.keys.to_a.map {|key| "#{key} = ?" }.flatten

        query = "SELECT * FROM #{table_name} WHERE #{@where_clause.join(' AND ')}"

        execute(query, params.values)
      end

      private

      def execute(query, bind_values)
        connection.query(query, bind_values) do |row|
          model_instance = self.new
          row.map {|(column, value)| model_instance.__send__ "#{column}=", value }

          model_instance
        end
      end

      def table_name
        self.to_s.downcase.pluralize
      end

      def connection
        @connection ||= Rubbish::Connection.new
      end
    end
  end
end
