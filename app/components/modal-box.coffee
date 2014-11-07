`import Ember from 'ember'`

ModalBoxComponent = Ember.Component.extend
  isModalVisible: no

  actions:
    hideModal: ->
      @set 'isModalVisible', no

`export default ModalBoxComponent`
