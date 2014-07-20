require 'test_helper'

describe Proposition do
  fixtures :propositions

  def setup
    @valid = propositions :valid
    @defaults = @valid.attributes
  end

  describe "valid?" do
    it "should fail for empty attributes" do
      proposition = Proposition.new
      assert proposition.invalid?
    end

    it "should pass for valid attributes" do
      proposition = Proposition.new @defaults
      assert proposition.valid?
    end
  end

  describe "record" do
    it "should get the object record" do
      proposition = Proposition.new text: "The first premise!"
      proposition.record.must_equal "proposition The first premise!"
    end
  end

  describe "sha1" do
    it "should compute the SHA-1 when missing" do
      proposition = Proposition.new text: "The first premise!"
      proposition.sha1.must_equal "37ca8beaaac1d1b8412c9fb1fd73e524c9862ebe"
    end

    it "should get the SHA-1 when stored" do
      sha1 = "1234567890123456789012345678901234567890"
      proposition = Proposition.new sha1: sha1
      assert_equal sha1, proposition.sha1
    end
  end
end
