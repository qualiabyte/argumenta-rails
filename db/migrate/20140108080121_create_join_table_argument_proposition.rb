class CreateJoinTableArgumentProposition < ActiveRecord::Migration
  def change
    create_table :arguments_propositions, id: false do |t|
      t.string  :argument_sha1
      t.string  :proposition_sha1
      t.integer :position
      t.index   [:argument_sha1, :proposition_sha1],
        unique: true,
        name: "index_arguments_propositions_unique"
      t.index   :argument_sha1
      t.index   :proposition_sha1
    end
  end
end
