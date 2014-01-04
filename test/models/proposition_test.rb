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
end
