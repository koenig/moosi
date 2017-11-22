`import DS from 'ember-data'`
`import ENV from "../config/environment"`
# ApplicationAdapter = DS.FixtureAdapter.extend()
ApplicationAdapter = DS.ActiveModelAdapter.extend
  host: ENV.host

`export default ApplicationAdapter`
