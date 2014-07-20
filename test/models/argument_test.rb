require 'test_helper'

describe Argument do
  fixtures :arguments, :propositions

  def setup
    @argument = arguments :valid
    @defaults = @argument.attributes
    @proposition = propositions :valid
  end

  describe "valid?" do
    it "should pass for valid attributes" do
      @argument.destroy
      argument = Argument.new @defaults
      assert argument.valid?, argument.errors.to_hash
    end

    it "should fail for empty attributes" do
      @argument.destroy
      argument = Argument.new
      assert argument.invalid?
    end
  end

  describe "title" do
    it "should get the title" do
      @argument.title.must_equal "My Argument ^_^"
    end
  end

  describe "premises" do
    it "should get the premises" do
      @argument.premises.must_equal propositions(:first, :second)
    end
  end

  describe "conclusion" do
    it "should get the conclusion" do
      @argument.conclusion.must_equal propositions(:conclusion)
    end
  end

  describe "propositions" do
    it "should add a proposition" do
      @argument.propositions.clear
      @argument.propositions << @proposition
      @argument.propositions.first.must_equal @proposition
      @proposition.arguments.must_include @argument
    end

    it "should get the propositions" do
      @argument.propositions.must_equal(
        propositions(:first, :second, :conclusion)
      )
    end
  end

  describe "record" do
    it "should get the object record" do
      record = @argument.record
      record.must_equal <<-END.gsub(/^ +/, '')
        argument

        title My Argument ^_^
        premise 37ca8beaaac1d1b8412c9fb1fd73e524c9862ebe
        premise 29da59119a5c3cec4f7b339433e8931ea99771cf
        conclusion 3940b2a6a3d5778297f0e37a06109f9d3dcffe6d
      END
    end
  end

  describe "sha1" do
    it "should compute the SHA-1 when missing" do
      @argument.propositions
      @argument.sha1 = nil
      sha1 = @argument.sha1
      sha1.must_equal "50250211801dabf9cbf0e574af270ba2c3fe83cb"
    end

    it "should get the SHA-1 when stored" do
      sha1 = @argument.sha1
      sha1.must_equal "50250211801dabf9cbf0e574af270ba2c3fe83cb"
    end
  end
end
