class AddIndexToArgumentsOnSha1 < ActiveRecord::Migration
  def change
    change_table :arguments do |t|
      t.change :sha1, :string, limit: 40, null: false
    end
    change_table :propositions do |t|
      t.change :sha1, :string, limit: 40, null: false
    end
    add_index :arguments, :sha1, unique: true
    add_index :propositions, :sha1, unique: true
  end
end
