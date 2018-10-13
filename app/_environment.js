// Define environment specific configuration for the Frontend.
// This file can be locally modified in the development environment.
// Changes in this file are only available locally in `grunt serve`.
//
// PLEASE NOTE:
//
// In production and test environments, the voting-api service will provide this file.
//
// This file WILL NOT BE AVAILABLE in `dist/` folder after `grunt build`.
// Error "_VAALIT is not defined" means that something went wrong with
// voting-api providing http://where.ever.we.are/_environment.js
//
// See also: `config/frontend_environment.js.erb` in voting-api.
//
// Be sure to reflect any changes here to voting-api also!
//
var _VAALIT = {
  api: {
    baseUrl: 'http://localhost:3000/api',
  },

  rollbar: {
    accessToken: '561ccbf95ce94730b7370e747e245d9f',
    environment: 'development',
  },

  google: {
    analytics: {
      id: null,
    },
  },

  voting: {
    signIn: {
      dailyOpeningTime: '10:00',
      dailyClosingTime: '18:00',
      startsAt: '2016-10-25 09:00:00 +0300',
      endsAt: '2016-10-30 18:00 +0300',
      terminatesAt: '2016-11-02 18:00 +0200',
    },
  },

  eligibility: {
    signIn: {
      startsAt: '2015-11-12 07:00 +0200',
      endsAt: '2015-12-14 17:00 +0200',
    },
  },

};
