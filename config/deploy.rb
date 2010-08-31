set :application, "totwguide"
set :repository,  "git@github.com:cylence/totwguide.git"

set :scm, :git
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

role :web, "72.249.83.84"                          # Your HTTP server, Apache/etc
role :app, "72.249.83.84"                          # This may be the same as your `Web` server
role :db,  "72.249.83.84", :primary => true # This is where Rails migrations will run
role :db,  "72.249.83.84"

# If you are using Passenger mod_rails uncomment this:
# if you're still using the script/reapear helper you will need
# these http://github.com/rails/irs_process_scripts

namespace :deploy do
  task :symlink, :except => { :no_release => true } do
    run "ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml"
  end
# task :start {}
# task :stop {}
# task :restart, :roles => :app, :except => { :no_release => true } do
#   run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
# end
end