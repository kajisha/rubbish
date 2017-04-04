require 'active_support'

ActiveSupport::Dependencies.autoload_paths = ['./lib/']

module Rubbish
  extend ActiveSupport::Autoload

  autoload :Connection, './lib/rubbish/connection.rb'
  autoload :Query, './lib/rubbish/query.rb'
end
