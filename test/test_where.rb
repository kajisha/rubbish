require 'test/unit'
require 'rubbish'
require 'pry'

class User
  include Rubbish::Query
  attr_accessor :id, :name
end

class TestWhere < Test::Unit::TestCase
  def test_where
    assert_equal 1, User.where(name: 'hoge').size
    assert_equal 'hoge', User.where(name: 'hoge').first.name
  end
end
