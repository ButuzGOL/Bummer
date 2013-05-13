$(document).ready ->
  window.ClientSideValidations.callbacks.element.fail = (element, message, callback, eventData) ->
    callback()

    if element.data('valid') isnt false
      $parent = $(element).parent()
      $parent = $parent.parent() if $parent.hasClass('field_with_errors')

      $parent.find('.validation-true').remove()
      
  window.ClientSideValidations.callbacks.element.pass = (element, callback, eventData) ->
    callback()

    success_template = '<div class="validation validation-true"><div class="icon"></div></div>'

    $parent = $(element).parent()
    $parent = $parent.parent() if $parent.hasClass('field_with_errors')

    if not $parent.find('.validation').length
      $parent.append success_template

  # $('#new_user input').on 'keyup', (e) ->
  #   clearTimeout window.keyUpTimeout
  #   _this = this
  #   window.keyUpTimeout = setTimeout ( ->
  #     # $(_this).data('changed', true).isValid(window.ClientSideValidations.forms.new_user.validators)
  #     # $(this).focus()
  #   ), 1000

  $('input[type=checkbox]').prettyCheckable()