class Argument < ActiveRecord::Base
  self.primary_keys = :sha1

  has_many :arguments_propositions,
    foreign_key: "argument_sha1"

  has_many :propositions,
    -> { order "position" },
    through: :arguments_propositions,
    foreign_key: "argument_sha1",
    primary_key: "sha1"

  validates :title,
    presence: true,
    length: { in: 1..100 }

  validates :sha1,
    presence: true,
    uniqueness: true,
    format: {
      with: /\A[0-9a-f]{40}\z/,
      message: "must be a 40 character hexadecimal string" }

  def premises
    propositions.slice(0, propositions.length - 1)
  end

  def conclusion
    propositions.last
  end
end
