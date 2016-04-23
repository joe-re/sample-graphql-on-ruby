require 'active_record'

ActiveRecord::Base.establish_connection(
  adapter:   'sqlite3',
  database:  ':memory:'
)

class InitialSchema < ActiveRecord::Migration
  def self.up
    create_table :posts do |t|
      t.string :title, null: false
      t.string :body, null: false
    end
  end

  def self.down
    drop_table :posts
  end
end

InitialSchema.migrate(:up)

