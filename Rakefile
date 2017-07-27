require 'data_mapper'
require './app/bm_manager.rb'

namespace :db do
  desc "Non destructive upgrade"
  task :auto_upgrade do
    DataMapper.auto_upgrade!
    puts "Auto-upgrade complete (no data loss)"
  end

  desc "Destructive upgrade"
  task :auto_migrant do
    DataMapper.auto_migrant!
    puts "Auto_migrant complete (data was lost)"
  end
end
