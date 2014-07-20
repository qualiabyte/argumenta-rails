require 'test_helper'

describe Argument do
  fixtures :arguments, :propositions

  def setup
    @argument = arguments :valid
    @defaults = @argument.attributes
    @proposition = propositions :valid
  end

  describe "valid?" do
    it "passes for valid attributes" do
      @argument.destroy
      argument = Argument.new @defaults
      assert argument.valid?, argument.errors.to_hash
    end

    it "fails for empty attributes" do
      @argument.destroy
      argument = Argument.new
      assert argument.invalid?
    end
  end

  describe "title" do
    it "gets the title" do
      @argument.title.must_equal "My Argument ^_^"
    end
  end

  describe "premises" do
    it "gets the premises" do
      @argument.premises.must_equal propositions(:first, :second)
    end
  end

  describe "conclusion" do
    it "gets the conclusion" do
      @argument.conclusion.must_equal propositions(:conclusion)
    end
  end

  describe "propositions" do
    it "adds a proposition" do
      @argument.propositions.clear
      @argument.propositions << @proposition
      @argument.propositions.first.must_equal @proposition
      @proposition.arguments.must_include @argument
    end

    it "gets the propositions" do
      @argument.propositions.must_equal(
        propositions(:first, :second, :conclusion)
      )
    end
  end
end
