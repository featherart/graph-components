`import Adapter from 'active-model-adapter'`
`import config from 'graph-components/config/environment'`

AppAdapter = Adapter.extend
  host: config.apiHost

`export default AppAdapter`
