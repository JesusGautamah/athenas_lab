web: bin/rails server
worker: bundle exec sidekiq -C config/sidekiq.yml
telegram: bundle exec bin/bot telegram
discord: bundle exec bin/bot discord
release: bin/rails db:migrate && rake assets:clobber
