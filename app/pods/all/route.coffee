`import Ember from 'ember'`

AllRoute = Ember.Route.extend(
  model: ->
    dataset:
      {
        # select count(assets_countries.id), countries.code from assets_countries join countries on assets_countries.country_id = countries.id
        # join assets on assets_countries.asset_id=assets.id group by countries.id
        data: [
          {name: "US", value: 12338},
          {name: "CA", value: 6695},
          {name: "AR", value: 5764},
          {name: "BR", value: 7947},
          {name: "MX", value: 6938},
          {name: "CL", value: 5734},
          {name: "CO", value: 5758},
          {name: "AU", value: 4056},
          {name: "NZ", value: 3866},
          {name: "AT", value: 4271},
          {name: "DE", value: 5738},
          {name: "CH", value: 4240},
          {name: "BE", value: 4745},
          {name: "NE", value: 5488},
          {name: "LU", value: 4021},
          {name: "DK", value: 5311},
          {name: "FI", value: 5281},
          {name: "NO", value: 5241},
          {name: "SE", value: 5357},
          {name: "UK", value: 5916},
          {name: "IE", value: 4478},
          {name: "FR", value: 6200},
          {name: "JP", value: 3957},
          {name: "ES", value: 4443},
          {name: "PR", value: 4174},
          {name: "IT", value: 523},
          {name: "KR", value: 1}
        ]
      }
)

`export default AllRoute`
