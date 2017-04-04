require 'active_support'

ActiveSupport::Dependencies.autoload_paths = ['./lib/']

module Rubbish
  extend ActiveSupport::Autoload

  autoload :Connection
  autoload :Query
end
