class CreateVotes < ActiveRecord::Migration[5.1]

  def self.up
    create_table :votes do |t|
      t.references :user, foreign_key: true
      t.references :voteable, polymorphic: true

      t.timestamps
    end
    add_index :votes, [:voteable_id, :voteable_type]
  end

  def self.down
    drop_table :votes
  end
end
