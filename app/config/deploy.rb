set :application, "symfony-ci"
set :domain,      "pugmi.it"
set :deploy_to,   "/var/www/#{domain}"
set :app_path,    "app"

role :web,        domain                         
role :app,        domain, :primary => true 

set :repository,  "https://github.com/morafabio/symfony-ci"
set :scm,         :git

set :keep_releases,  	5

# Set SSH config
set :user,	"vagrant"
set :use_sudo,	true

# Set ORM type and the database hostname
set  :model_manager, 	"doctrine" 
role :db, domain 	# Migrations will run here

# Unversioned shared resources
set :shared_files,      ["app/config/parameters.yml"]
set :shared_children,   [app_path + "/logs", web_path + "/uploads", "vendor"]

# Checkout latest git tag for deploy
set :branch, 	  `git tag`.split("\n").last

# Tasks to perform before switching the current/ symlink
before "symfony:cache:warmup", "symfony:doctrine:migrations:migrate"



