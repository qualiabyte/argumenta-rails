require 'test_helper'

class ArgumentTest < ActiveSupport::TestCase
  fixtures :arguments

  def setup
    @valid = arguments :valid
    @defaults = @valid.attributes
    @valid.destroy
  end

  test "validation fails for empty attributes" do
    argument = Argument.new
    assert argument.invalid?
  end

  test "validation passes for valid attributes" do
    argument = Argument.new @defaults
    assert argument.valid?, argument.errors.to_hash
  end
end
