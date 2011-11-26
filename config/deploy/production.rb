set :domain, "176.28.16.3"
set :user, "wogo"

set :rails_env, "production"
set :branch, "production" unless exists?(:branch)
set :deploy_to, "/home/strokeunit/production"