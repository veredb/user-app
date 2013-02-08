class CreatePlayers < ActiveRecord::Migration
  def self.up
    create_table :players do |t|
      t.string :playerID
      t.integer :birthYear
      t.string :nameFirst
      t.string :nameLast

      t.timestamps
    end
  end

  def self.down
      drop_table :players
  end
end
