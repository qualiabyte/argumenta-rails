class Argument < ActiveRecord::Base
  self.primary_keys = :sha1

  has_and_belongs_to_many :propositions,
    foreign_key: "argument_sha1",
    association_foreign_key: "proposition_sha1"

  validates :title,
    presence: true,
    length: { in: 1..100 }

  validates :sha1,
    presence: true,
    uniqueness: true,
    format: {
      with: /\A[0-9a-f]{40}\z/,
      message: "must be a 40 character hexadecimal string" }
end
