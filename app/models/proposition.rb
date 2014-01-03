class Proposition < ActiveRecord::Base

  validates :text, :sha1,
    presence: true

  validates :text,
    length: { in: 1..240 }

  validates :sha1,
    format: {
      with: /\A[0-9a-f]{40}\z/,
      message: "must be a 40 character hexadecimal string" }

end
