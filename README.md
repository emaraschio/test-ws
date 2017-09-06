# Background:

A group event will be created by an user. The group event should run for a whole number of days e.g.. 30 or 60. There should be attributes to set and update the start, end or duration of the event (and calculate the other value). The event also has a name, description (which supports formatting) and location. The event should be draft or published. To publish all of the fields are required, it can be saved with only a subset of fields before it’s published. When the event is deleted/remove it should be kept in the database and marked as such.

# Deliverable:

Write an AR model, spec and migration for a GroupEvent that would meet the needs of the description above. Then write the api controller and spec to support JSON request/responses to manage these GroupEvents. For the purposes of this exercise, ignore auth. Please provide your solution as a rails app called exercise_YYMMDD_yourname, sent as a zip file.

# HOW TOs

### How to build the project
```
bundle install
rails db:migrate RAILS_ENV=development
rails db:migrate RAILS_ENV=test
rails s
```

### You can explore the API based on Swagger, here is the URL:
```
http://localhost:3000/index.html
```

### How to run the tests
```
bundle exec rspec
```

### How to run a single test
```
bundle exec rspec path/to/spec.rb
```

### How to run migrations
```
rails db:migrate RAILS_ENV=development
rails db:migrate RAILS_ENV=test
```
