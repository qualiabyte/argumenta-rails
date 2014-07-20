require 'test_helper'

class ArgumentTest < ActiveSupport::TestCase
  fixtures :arguments, :propositions

  def setup
    @argument = arguments :valid
    @defaults = @argument.attributes
    @proposition = propositions :valid
  end

  test "validation fails for empty attributes" do
    @argument.destroy
    argument = Argument.new
    assert argument.invalid?
  end

  test "validation passes for valid attributes" do
    @argument.destroy
    argument = Argument.new @defaults
    assert argument.valid?, argument.errors.to_hash
  end

  test "add a proposition" do
    @argument.propositions.clear
    @argument.propositions << @proposition
    assert_equal @argument.propositions.first, @proposition
    assert_includes @proposition.arguments, @argument
  end

  test "access title" do
    assert_equal "My Argument ^_^", @argument.title
  end

  test "access premises" do
    assert_equal propositions(:first, :second),
      @argument.premises
  end

  test "access conclusion" do
    assert_equal propositions(:conclusion),
      @argument.conclusion
  end

  test "access propositions" do
    assert_equal propositions(:first, :second, :conclusion),
      @argument.propositions
  end
end
