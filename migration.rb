#!/usr/bin/env ruby
$LOAD_PATH.unshift(File.expand_path(File.dirname(__FILE__)))
require 'db_connect'

class InitialSchema < ActiveRecord::Migration
  def self.up
    create_table :posts do |t|
      t.string :title, null: false
      t.string :body, null: false
      t.references :comments
    end

    create_table :comments do |t|
      t.string :body, null: false
      t.references :post
    end
  end

  def self.down
    drop_table :posts
    drop_table :comments
  end
end

InitialSchema.migrate(:up)
