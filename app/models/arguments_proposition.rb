class ArgumentsProposition < ActiveRecord::Base
  self.primary_keys = :argument_sha1, :proposition_sha1

  belongs_to :argument, foreign_key: 'argument_sha1'
  belongs_to :proposition, foreign_key: 'proposition_sha1'
end
