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
# You may need to reopen your shell to get these available in the nodenv shims (`exec zsh -l`)
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

a) Access the nodejs web server directly:
  Run `grunt serve` and access http://localhost:9000

b) Access the built voting frontend via the Rails web server (public/ folder):
  - Follow instructions in voting-api README
  - See instructions below at "Deploy Frontend alongside with API"
  - Nutshell: `grunt build` and make voting-frontend:dist/ available in voting-api:public/
    - NOTE: ensure `grunt serve` is not running at the same time as `grunt build`

### Accessing the local "grunt serve" web server as an authenticated user with JWT

Signing in with Haka Single-Sign On works only directly from "rails serve" (port 3000).
To sign in to frontend development web-server "grunt serve", create a JWT Access Token as follows.

- You will need a valid JWT Access Token from voting-api:
  - In voting-api, generate an example JWT_ACCESS_TOKEN:
    - `rake jwt:voter:generate voter_id=1 expiry_hours=1000`
    - click one of the links generated from that command's output
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
- If you receive a CORS error, ensure localhost:3000 has the correct backend answering.

- See `app/scripts/app.coffee` for application routes.

- RollbarError monitoring can be simulated with
    `window.onerror("TestRollbarError: testing window.onerror", window.location.href)`

- Update the dates and contact information:
  - Find all comments with "#NOTE" and change their content accordingly.
  - Read through the locale files and find each date, email address and phone number.

- When updating the localised content, it's useful to split the editor horizontally in three
  visible editor panes each propagate the change one-by-one to every language file at once.
  You can split the editor pane in Visual Code by dragging the open tab (where filename is
  presented) to the bottom of the pane.

## Generators

`yo angular:controller cat`

## Testing

Running `grunt test` will run the unit tests with karma.


## Deploy Frontend alongside with API

Frontend is distributed as a `git submodule`:
  * Updating the submodule is automated by `bin/distribute.sh`.
  * The script senerates `dist/` with `grunt build`
    * ensure `grunt serve` is not runnng at the same time as `grunt build`.
  * Then a commit is pushed to Frontend's independent distribution repository.
  * As a last step, Voting API's copy of the submodule is updated.

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
