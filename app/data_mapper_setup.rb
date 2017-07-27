require 'sinatra/flash'
require 'data_mapper'
require 'dm-postgres-adapter'
require 'bcrypt'
require_relative 'models/user'
require_relative 'models/tag'
require_relative 'models/link'

DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/bookmark_manager_#{ENV['RACK_ENV']}")
DataMapper.finalize
DataMapper.auto_upgrade!
