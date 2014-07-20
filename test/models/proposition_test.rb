require 'test_helper'

class PropositionTest < ActiveSupport::TestCase
  fixtures :propositions

  def setup
    @valid = propositions :valid
    @defaults = @valid.attributes
  end

  test "validation fails for empty attributes" do
    proposition = Proposition.new
    assert proposition.invalid?
  end

  test "validation passes for valid attributes" do
    proposition = Proposition.new @defaults
    assert proposition.valid?
  end

  test "returns a valid record" do
    proposition = Proposition.new text: "The first premise!"
    assert_equal "proposition The first premise!",
      proposition.record
  end

  test "returns a valid sha1" do
    proposition = Proposition.new text: "The first premise!"
    assert_equal "37ca8beaaac1d1b8412c9fb1fd73e524c9862ebe",
      proposition.sha1
  end

  test "returns a stored sha1" do
    sha1 = "1234567890123456789012345678901234567890"
    proposition = Proposition.new sha1: sha1
    assert_equal sha1, proposition.sha1
  end
end
