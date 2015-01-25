`import Ember from 'ember'`

NohelpTextareaComponent = Ember.TextArea.extend
  attributeBindings: 'autocomplete autocorrect autocapitalize spellcheck'.w()
  autocomplete: "off"
  autocorrect: "off"
  autocapitalize: "off"
  spellcheck: off

`export default NohelpTextareaComponent`
