class Argument < ActiveRecord::Base

  validates :title, :sha1,
    presence: true

  validates :sha1,
    uniqueness: true

  validates :title,
    length: { in: 1..100 }

  validates :sha1,
    format: {
      with: /\A[0-9a-f]{40}\z/,
      message: "must be a 40 character hexadecimal string" }

end
