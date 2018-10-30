# hyy-voting-frontend

## Prerequisites

- Install RVM
- After installing RVM, let RVM install Ruby version defined in .ruby-version (chdir out & back from project directory).
- `gem install bundler`
- `bundle install` (this will install compass, see `Gemfile`)

- [Install nodenv](https://github.com/nodenv/nodenv)
- Install Node version defined in `.node-version`
  - nodenv install 10.12.0

## Setup

~~~
npm install -g yarn bower grunt-cli yo

bundle install
yarn install
bower install

git submodule update --init
~~~

## Configuration

### Environment variables
When served locally with `grunt serve`:
- Edit `app/_environment.js` which contains environment specific configuration.

When being served from the API's `public/` folder:
- Set API's environment variables which begin with `FRONTEND_`, see API's README for details about setting API's environment variables in `.env`, `.env.example`.
- In Heroku, environment variables are set with `heroku config`. See API's README for further details.

## Development

Run `grunt serve` and access http://localhost:9000


### Accessing the local web server

- You will need a valid JWT Access Token from the API:
  - In voting-api, generate an example JWT_ACCESS_TOKEN: `rake jwt:voter:generate`
  - open http://localhost:9000/#/sign-in?token=JWT_ACCESS_TOKEN
  - See API's README for details.
  - Note that your frontend's development server runs on port 9000,
    and the voting-api's Rails server runs on port 3000.
- When the voting-api `rails s` is running, you will have TWO frontends available:
  - one served locally by `grunt serve` (localhost:9000)
  - and the one which is served by Rails from `voting-api/public` folder
    (localhost:3000). Use only either of them at the same time.
  - If you need to access localhost:3000 (ie. `voting-api/public` served by
    Rails), prevent confusion by *not* running `grunt serve` at the same time. :)

- See `app/scripts/app.coffee` for application routes.

- RollbarError monitoring can be simulated with
    `window.onerror("TestRollbarError: testing window.onerror", window.location.href)`



## Generators

`yo angular:controller cat`

## Testing

Running `grunt test` will run the unit tests with karma.


## Deploy Frontend alongside with API

Frontend is distributed as a `git submodule`:
  * Code is generated with `grunt build`.
  * Then a commit is pushed to Frontend's independent distribution repository.
  * As a last step, Voting API's copy of the submodule is updated.
  * Updating the submodule is automated by `bin/distribute.sh`.

Submodule distribution allows the maintainer track exactly which compilation
of the Frontend is being used against the API. If Frontend's code was deployed
independently to eg. Amazon S3, then it could be updated without
any changes being required in the API. This is not preferred in an
election system, where each production deploy (of both API and Frontend) need
to be carefully audited.

```bash
# Setup Frontend's git submodule (first time only)
git submodule add git@github.com:pre/hyy-voting-frontend-dist.git
```

```bash
# Update code in Frontend's git submodule (for each deploy)
(in Frontend) bin/distribute.sh
(in Frontend) git push

# Update API's git submodule to apply Frontend's new code
(in API) cd public
(in API) git checkout master
(in API) git pull
In API/public, `git log` should now display 'Theme of this deploy' as the newest commit.
```

```bash
# Commit 'Theme of this deploy' into API's git repository:
(in API) git add public && git commit -m 'deploy Theme of this deploy'
```


## Tips & Troubleshooting

* After bin/distribute.sh - if you get `fatal: in unpopulated submodule 'dist'`
  you haven't cloned the git submodule. The build now created naked files under
  the `dist/` folder.
  * Remove the `dist/` folder (`rm -fr dist/`)
  * Refresh the git submodule `git submodule update --init`
  * Try again with distribute.sh

* If you get error `Unknown provider: xyzProvider <- xyz <- XyzCtrl`,
  add `<script src="..../xyz.js">` to the bottom of `app/index.html`.

* For information that will change for each election: `git grep "#NOTE"`.
