class CreateArguments < ActiveRecord::Migration
  def change
    create_table :arguments do |t|
      t.string :title
      t.string :sha1

      t.timestamps
    end
  end
end
