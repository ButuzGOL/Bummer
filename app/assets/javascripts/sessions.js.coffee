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

  $('#form-sign-in, #form-forgot-password').on 'ajax:success', (e, data, status, xhr) ->
    if $(this).find('.validation').length
      $(this).find('.validation').remove()

    if data.success
      window.location = data.data.redirect_url
    else
      $error_template = $('<div class="validation validation-false"><div class="icon"></div><div class="message"></div></div>')
      $error_template.find('.message').text data.errors[0]
      
      $(this).find('.login').append $error_template

