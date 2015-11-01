# hyy-voting-frontend

## Prerequisites

- Install Node 0.12 with NVM
- `npm install -g grunt-cli bower yo generator-karma generator-angular`

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

## Build & development

Run `grunt` for building and `grunt serve` for preview.

## Generators

`yo angular:controller cat`

## Testing

Running `grunt test` will run the unit tests with karma.
