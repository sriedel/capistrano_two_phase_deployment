# Two-Phase Deployment for Capistrano 3.1

This gem provides two-phase deployment capabilities to capistrano 3.

The deployment process is split into two phases: the first generates a 
tar.gz file of the content to be deployed via ```cap deploy:prepare_release```
and uploads it to an intermediary server. This intermediary server should 
ideally be located in the network infrastructure of your application servers.

In the second phase (```cap deploy```), the frontend servers pull the current
release from the intermediary server and install it locally.

This allows the servers to not require an installed SCM (e.g. git),
and saves network bandwith, because the new release is no longer transmitted
to all servers from an external source.

## Installation
Add the following to your deploy.rb file:
```
set :scm, :intermediate_host
set :intermediate_host, "host.example.com"
```

## Capistrano Directory structure on the intermediary host
These recipes will use the same capistrano directory structure on the 
intermediary host as on the application servers.

The tar Archives are stored as {deploy_to}/releases/{timestamp}.tar.gz with
a {deploy_to}/current_tgz symlink pointing to the release tarfile that should
be pulled in the second phase of the deployment process. This also allows your
intermediary host to be a regular application server.

## Release directory changes from the capistrano default
Unlike the default capistrano release path name, the release path will now
consist of two timestamps:
{deploy_to}/releases/{deployment_timestamp_of_phase2}_#{timestamp_of_release_preparation}/

Using this directory name format, you can deploy the same intermediary archive
multiple times without conflicting with an existing deployment of the same
version. This can come in handy in case you generate additional files during
your deployment that are not part of the tar archive (e.g. rendering configuration
file templates, locally compiled assets during deployment etc.).

## Configuration Options
```
# Host which acts as intermediary for the deployment files
# NOTE: only the primary host is currently evaluated
role :intermediate_host, "host.example.com"

# Which format git archive should output as. See the git archive manual page.
# Defaults to tar.gz
set :archive_format, "tar.gz"

# Where to output the generated git archive locally before uploading.
# Will use Tempfile.new by default to create non-static filename.
# The tempfile will be deleted after capistrano terminates.
set :archive_output, "myfile"

# Which branch git archive should generate the tar file from.
set :branch, "production"
```

## Caveats/TODOs
* Only supports git at the moment
* Will only evaluate the primary intermediary host

