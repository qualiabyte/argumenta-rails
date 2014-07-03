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
    assert_equal @proposition, @argument.propositions.first
    assert_includes @proposition.arguments, @argument
  end

  test "access title" do
    assert_equal @argument.title, "My Argument ^_^"
  end

  test "access premises" do
    assert_equal @argument.premises,
      propositions(:first, :second)
  end

  test "access conclusion" do
    assert_equal @argument.conclusion,
      propositions(:conclusion)
  end

  test "access propositions" do
    assert_equal @argument.propositions,
      propositions(:first, :second, :conclusion)
  end
end
