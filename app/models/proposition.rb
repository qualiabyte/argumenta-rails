class Proposition < ActiveRecord::Base
  has_and_belongs_to_many :arguments,
    foreign_key: "proposition_sha1",
    association_foreign_key: "argument_sha1"

  validates :text,
    presence: true,
    length: { in: 1..240 }

  validates :sha1,
    presence: true,
    format: {
      with: /\A[0-9a-f]{40}\z/,
      message: "must be a 40 character hexadecimal string" }
end
