class CreatePropositions < ActiveRecord::Migration
  def change
    create_table :propositions do |t|
      t.string :text, limit: 240, null: false
      t.string :sha1, limit: 40, null: false

      t.timestamps
    end
  end
end
