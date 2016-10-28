
FetchStaticTables = Em.Object.create
  name: 'fetch-static-tables'
  initialize: (application) ->
    store = application.container.lookup('service:store')
    # store.findAll('region')
    store.findAll('country')

`export default FetchStaticTables`
