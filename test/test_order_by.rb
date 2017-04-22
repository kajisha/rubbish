require 'test/unit'
require 'rubbish'
require_relative './user'

class TestOrderBy < Test::Unit::TestCase
  def test_descendant
    actual = User.where(name: 'fuga').order_by(id: :desc).to_a

    assert_equal [4, 3, 2], actual.map(&:id)
  end
end
