require 'bundler/capistrano'

set :stages, %w(production)
set :rake, 'bundle exec rake'
set :default_stage, 'staging'
require 'capistrano/ext/multistage'

set :application, "strokeunit.net"
set :repository,  "git@github.com:newmetl/strokeunit.net.git"

set :use_sudo,    false

ssh_options[:forward_agent] = true
set :scm, :git
set :deploy_via, :remote_cache
set :git_enable_submodules, 1

after 'multistage:ensure' do
  #(because we need domain to be set)
  role :app, domain
  role :web, domain
  role :db,  domain, :primary => true
end

namespace :deploy do
  task(:start,   :roles => :app) {}
  task(:stop,    :roles => :app) {}
  task(:restart, :roles => :app, :except => { :no_release => true }) {
    run "touch #{File.join(current_path,'tmp','restart.txt')}"
  }
end