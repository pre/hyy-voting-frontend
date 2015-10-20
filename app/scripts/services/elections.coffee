'use strict'

angular.module 'hyyVotingFrontendApp'
  .factory 'elections', ->
    get: ->
      [{
        id: 1,
        type: "faculty"
        name: "Humanistinen tiedekunta",
        candidates: {
          url: "/mock_api/hum_tdk-candidates.json"
        },
        alliances: {
          url: "/mock_api/hum_tdk-alliances.json"
        },
        voted_at: "2015-10-21"
      },

      {
        id: 2,
        type: "department",
        name: "Filosofian laitos",
        candidates: {
          url: "/mock_api/hum_tdk-candidates.json"
        },
        alliances: {
          url: "/mock_api/hum_tdk-alliances.json"
        },
        voted_at: null
      },

      {
        id: 3,
        type: "college"
        name: "Kollegio (Humanistit)",
        candidates: {
          url: "/mock_api/hum_tdk-candidates.json"
        },
        alliances: {
          url: "/mock_api/hum_tdk-alliances.json"
        },
        voted_at: "2015-10-20"
      },
      ]
