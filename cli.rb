#!/usr/bin/env ruby
$LOAD_PATH.unshift(File.expand_path(File.dirname(__FILE__)))
require 'graphql'
require 'db_connect'
require 'comment'
require 'post'
require 'seed'
require 'graphql_schema'

result_hash = Schema.execute(ARGV[0])
p result_hash
