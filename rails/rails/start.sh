#!/bin/bash

source /etc/profile.d/rbenv.sh;
source /etc/profile.d/nvm.sh;
cd /var/www/app;
RAILS_ENV=production bundle exec rake deploy:prepare;
bundle exec unicorn_rails -c /var/www/app/config/unicorn.rb -E production

