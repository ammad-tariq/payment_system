# Payment System

This is a Payment System application.

## Development Setup

1. Clone the repo:

  ```
  $ git clone git@github.com/ammad-tariq/payment_system.git
  $ cd payment_system
  ```

2. Install dependencies and prepare database:

  ```
  $ ./bin/setup
  ```

3. You're up and running. Just start rails server:

  ```
  $ bundle exec bin/rails s
  ```

4. (Optional) For front-end development, webpack-dev-server on a seperate terminal will enable live-reload:

  ```
  $ bin/webpack-dev-server
  ```

Notes:

* If you encounter errors, you may need to run `bundle install`, `rails db:migrate` or `yarn install`.
* Make sure you have PostgreSQL up and running. You can use `ps auxwww | grep postgres` to check if Postgres is running.


## Running tests

Payment System is covered with basic functional tests using RSpec, FactoryBot and Capybara. 
To run the test suite in the `payment_system` directory run:
  ```
  Prepare Test Database:
  $ rails db:test:prepare

  Ruby tests for controllers, models via factories, RAILS_ENV is especially required inside VSCode Remote Dev Environment:
  $ RAILS_ENV=test rspec spec

  
  Rubocop:
  $ rubocop

    ```
