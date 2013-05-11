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

# Update WordPress specifically and any other submodules that may exist
git submodule foreach git pull

# As we're in active development of Twenty Thirteen, move any new changes
# from trunk to the true content directory for the site. We'll need to
# push changes to the repository later.
rsync -rv --delete /srv/www/deploy-stage/jeremyfelt.com/wordpress/wp-content/themes/twentythirteen/* /srv/www/deploy-stage/jeremyfelt.com/content/themes/twentythirteen/

# Deploy web files
rsync -rv --delete --exclude '.git' --exclude 'external-plugins' --exclude 'content/images' --exclude 'content/uploads' /srv/www/deploy-stage/jeremyfelt.com/* /srv/www/jeremyfelt.com/

# Need a hook to flush caches as the www-data user...
