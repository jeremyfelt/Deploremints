# Deploy script for jeremyfelt.com
#
# Script is called via a POST hook from Bitbucket and is run as the
# www-data user on the server. The `jeremyfelt.com` directory was first
# cloned as the www-data user for cleaner seeming file permissions

# Change into the repository directory...
cd /srv/www/deploy-stage/jeremyfelt.com/

# Pull latest changes from the repository...
git pull origin master

# Address Jeremy's annoyances at files being group read-only
chmod -R g+w *
