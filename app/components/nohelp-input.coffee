`import Ember from 'ember'`

NohelpInputComponent = Ember.TextField.extend
  attributeBindings: 'autocomplete autocorrect autocapitalize spellcheck'.w()
  autocomplete: "off"
  autocorrect: "off"
  autocapitalize: "off"
  spellcheck: off

`export default NohelpInputComponent`
