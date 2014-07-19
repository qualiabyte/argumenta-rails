class Proposition < ActiveRecord::Base
  self.primary_keys = :sha1

  has_many :arguments_propositions,
    foreign_key: "proposition_sha1"

  has_many :arguments,
    through: :arguments_propositions,
    foreign_key: "proposition_sha1",
    primary_key: "sha1"

  validates :text,
    presence: true,
    length: { in: 1..240 }

  validates :sha1,
    presence: true,
    format: {
      with: /\A[0-9a-f]{40}\z/,
      message: "must be a 40 character hexadecimal string" }

  def sha1
    super() or
    Digest::SHA1.hexdigest record
  end

  def record
    "proposition #{text}"
  end

  def serializable_hash(options)
    options ||= {}
    defaults = { except: [:created_at, :updated_at] }
    super(defaults.merge(options))
  end
end
