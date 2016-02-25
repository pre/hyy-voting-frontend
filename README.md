# hyy-voting-frontend

## Prerequisites

- Install Node 0.12 with NVM
- `npm install -g grunt-cli bower yo generator-karma generator-angular`
- Install RVM
- After installing RVM, let RVM install Ruby version defined in .ruby-version (chdir out & back from project directory).
- `gem install bundler`

## Setup

~~~
bundle install
npm install
bower install
~~~

## Configuration

- Set Google tracking id in app/main.html
- Set Rollbar client access token in app/main.html
  - Error monitoring can be simulated by
    `window.onerror("TestRollbarError: testing window.onerror", window.location.href)`
- Ensure you have development API up and running (see restangular.coffee for backend selection).

## Build for deploy

Run `grunt`

## Development

Run `grunt serve` and access http://localhost:9000

## Generators

`yo angular:controller cat`

## Testing

Running `grunt test` will run the unit tests with karma.
