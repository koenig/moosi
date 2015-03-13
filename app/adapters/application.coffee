`import DS from 'ember-data'`

# ApplicationAdapter = DS.FixtureAdapter.extend()
ApplicationAdapter = DS.ActiveModelAdapter.extend
  host: 'http://0.0.0.0:3000'

`export default ApplicationAdapter`
