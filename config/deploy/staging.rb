# Set the github branch that will be used for this deployment.
set :branch, "develop"

# Set the host and user as separate variables since Capistrano 3 doesn’t seem to have an easy way to access that info.
# TODO: Figure out a better way to do this since 'ENV["CAP_USER"]' will override the fallback in the 'server' setup logic.
# set :deploy_host, "sandbox-centos-68.local"
deploy_hosts = [ "prod0.arsaurum.com" ]
set :deploy_user, "sysop"

# Set the details of the destination server you will be deploying to.
deploy_hosts.each { |deploy_host|
  server deploy_host, user: ENV["CAP_USER"] || fetch(:deploy_user), roles: %w{app db web}, my_property: :my_value
}

# Set the name for the deployment type.
set :deployment_type, "staging"

# The live directory path which the current version will be linked to.
set :live_path, "html/staging.arsaurum.com"

# Set the 'deploy_to' directory for this task.
set :deploy_to, "/var/www/builds/#{fetch(:application)}/#{fetch(:deployment_type)}"
