rails db:migrate
rails db:seed

puma -e production -C config/puma.rb
# web: bundle exec puma -C config/puma.rb
