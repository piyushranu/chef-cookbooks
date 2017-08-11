packages = %w(nginx python-pip pgpool2 libpq-dev mercurial python-dev lzma-dev liblzma-dev libxml2-dev libpq-dev libxslt-dev python-virtualenv)
packages.each do |pkg|
  package pkg
end

user 'test_user' do
  comment 'celery user'
  home '/home/test_user'
  shell '/bin/bash'
end
