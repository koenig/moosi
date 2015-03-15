`import DS from 'ember-data'`
`import ENV from "../config/environment"`
# ApplicationAdapter = DS.FixtureAdapter.extend()
ApplicationAdapter = DS.ActiveModelAdapter.extend
  host: ENV.host or 'http://0.0.0.0:3000'

`export default ApplicationAdapter`
