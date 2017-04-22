require 'rubbish'

class User
  include Rubbish::Query
  attr_accessor :id, :name
end
