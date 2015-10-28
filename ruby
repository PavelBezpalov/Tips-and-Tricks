INSTALLATION
Pre Install Checklist
sudo apt-get update sudo apt-get upgrade

Add apt repositories
From the Brightbox site.
https://www.brightbox.com/docs/ruby/ubuntu/
sudo apt-get install software-properties-common
sudo apt-add-repository ppa:brightbox/ruby-ng
sudo apt-get update

sudo apt-get install ruby2.2 ruby2.2-dev
sudo apt-get install ruby-switch
sudo apt-get install bundler
sudo ruby-switch --set ruby2.2
ruby -v

Install Other Dependencies
sudo apt-get update
sudo apt-get install git-core curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev python-software-properties libffi-dev nodejs nodejs-legacy libmagickwand-dev exuberant-ctags rar

Install PostgreSQL
sudo sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt/ $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list'
sudo apt-get install wget ca-certificates
sudo apt-get update
sudo apt-get upgrade
sudo apt-get install postgresql-9.4 postgresql-common

Install ImageMagick
sudo apt-get install imagemagick

Install Rails
gem install rails --no-rdoc --no-ri



Create a new app
mkdir projects
cd projects
rails new testapp
cd testapp
subl -n .
bin/rails server

Create a quick scaffold
bin/rails generate scaffold name title:string first:string last:string
bin/rake db:migrate
bin/rails s



INSTALLATION USING RVM
source: https://gorails.com/setup/ubuntu/15.04
and: http://www.postgresql.org/download/linux/debian/


Remove previous installed ruby, rbenv, postgresql
sudo apt-get remove rbenv ruby* postgresql*
sudo apt-get autoremove
sudo apt-get autoclean


The first step is to install some dependencies for Ruby.

sudo apt-get update
sudo apt-get install git-core curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev python-software-properties libffi-dev libgmp-dev


The installation for rvm is pretty simple:

sudo apt-get install libgdbm-dev libncurses5-dev automake libtool bison libffi-dev
curl -L https://get.rvm.io | bash -s stable
source ~/.rvm/scripts/rvm
rvm install 2.2.3
rvm --default use 2.2.3 
ruby -v

Now we tell Rubygems not to install the documentation for each package locally and then install Bundler

echo "gem: --no-ri --no-rdoc" > ~/.gemrc
gem install bundler


REBOOT!


Configuring Git

We'll be using Git for our version control system so we're going to set it up to match our Github account. If you don't already have a Github account, make sure to register. It will come in handy for the future.

Replace my name and email address in the following steps with the ones you used for your Github account.

git config --global color.ui true
git config --global user.name "YOUR NAME"
git config --global user.email "YOUR@EMAIL.com"
ssh-keygen -t rsa -C "YOUR@EMAIL.com"

The next step is to take the newly generated SSH key and add it to your Github account. You want to copy and paste the output of the following command and paste it here.

cat ~/.ssh/id_rsa.pub

Once you've done this, you can check and see if it worked:

ssh -T git@github.com

You should get a message like this:

Hi excid3! You've successfully authenticated, but GitHub does not provide shell access.


Installing Rails

Since Rails ships with so many dependencies these days, we're going to need to install a Javascript runtime like NodeJS. This lets you use Coffeescript and the Asset Pipeline in Rails which combines and minifies your javascript to provide a faster production environment.

To install NodeJS, we're going to add it using a PPA repository:

sudo add-apt-repository ppa:chris-lea/node.js
sudo apt-get update
sudo apt-get install nodejs

And now, without further adieu:

gem install rails -v 4.2.4

rails -v
# Rails 4.2.4

If you get a different result for some reason, it means your environment may not be setup properly.

Setting Up PostgreSQL

For PostgreSQL, we're going to add a new repository to easily install a recent version of Postgres 9.3.

sudo apt-get install postgresql-9.4
or
sudo apt-get install postgresql-9.3

The postgres installation doesn't setup a user for you, so you'll need to follow these steps to create a user with permission to create databases. Feel free to replace chris with your username.

sudo -u postgres createuser YOUR_SYSTEM_USER_NAME -s

# If you would like to set a password for the user, you can do the following

sudo -u postgres psql
postgres=# \password USER_NAME


Final Steps

And now for the moment of truth. Let's create your first Rails application:

#### If you want to use SQLite (not recommended)
rails new myapp

#### If you want to use MySQL
rails new myapp -d mysql

#### If you want to use Postgres
# Note that this will expect a postgres user with the same username
# as your app, you may need to edit config/database.yml to match the
# user you created earlier
rails new myapp -d postgresql

# Move into the application directory
cd myapp

# If you setup MySQL or Postgres with a username/password, modify the
# config/database.yml file to contain the username/password that you specified

# Create the database

rake db:create

rails server

You can now visit http://localhost:3000 to view your new website!