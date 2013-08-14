$(document).ready ->
  # _form

  newMicropostContentMaxLength = 300

  enableDisableNewMicropostSubmit = ->
    $form = $ '#new_micropost'

    $form.find('[type=submit]').prop 'disabled', not (
      $form.find('[name="micropost[name]"]').val().length and
      $form.find('[name="micropost[content]"]').val().length and
      $form.find('[name="micropost[content]"]').val().length <= 
        newMicropostContentMaxLength and
      Number($form.find('[name="micropost[stars]"]').val()) isnt 0)

  $('#new_micropost .stars .star').hover(
    (e) ->
      $(@).parent().find('.star').removeClass 'full'
      index = $('.star').index $(@)
      $(@).parent().find('.star').slice(0, index).addClass 'hover'
    (e) ->  
      index = $('.star').index $(@)
      $(@).parent().find('.star').slice(0, index).removeClass 'hover'
      $(@).parent().find('.star').slice(0, $(@).closest('form').
        find('input[name="micropost[stars]"]').val()).addClass 'full'
  )

  $('#new_micropost .stars .star').on 'click', (e) ->
    $(@).parent().find('.star').removeClass 'full'
    index = $('.star').index($(@)) + 1
    $(@).parent().find('.star').slice(0, index).addClass 'full'
    $(@).closest('form').find('input[name="micropost[stars]"]').val index

    enableDisableNewMicropostSubmit()

  $('#new_micropost [name="micropost[content]"]').simplyCountable
    counter: 'form footer .counter'
    maxCount: newMicropostContentMaxLength

  $('#new_micropost [type=text],textarea').on 'keyup paste cut', () ->
    enableDisableNewMicropostSubmit()

  