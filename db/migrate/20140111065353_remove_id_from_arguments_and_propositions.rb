class RemoveIdFromArgumentsAndPropositions < ActiveRecord::Migration
  def change
    remove_column :arguments, :id, :integer
    remove_column :propositions, :id, :integer
  end
end
