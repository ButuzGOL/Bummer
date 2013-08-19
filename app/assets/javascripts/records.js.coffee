$(document).ready ->
  # _form

  newRecordContentMaxLength = 300

  enableDisableNewRecordSubmit = ->
    $form = $ '#new_record'

    $form.find('[type=submit]').prop 'disabled', not (
      $form.find('[name="record[name]"]').val().length and
      $form.find('[name="record[content]"]').val().length and
      $form.find('[name="record[content]"]').val().length <= 
        newRecordContentMaxLength and
      Number($form.find('[name="record[stars]"]').val()) isnt 0)

  $('#new_record .stars .star').hover(
    (e) ->
      $(@).parent().find('.star').removeClass 'full'
      index = $('.star').index $(@)
      $(@).parent().find('.star').slice(0, index).addClass 'hover'
    (e) ->  
      index = $('.star').index $(@)
      $(@).parent().find('.star').slice(0, index).removeClass 'hover'
      $(@).parent().find('.star').slice(0, $(@).closest('form').
        find('input[name="record[stars]"]').val()).addClass 'full'
  )

  $('#new_record .stars .star').on 'click', (e) ->
    $(@).parent().find('.star').removeClass 'full'
    index = $('.star').index($(@)) + 1
    $(@).parent().find('.star').slice(0, index).addClass 'full'
    $(@).closest('form').find('input[name="record[stars]"]').val index

    enableDisableNewRecordSubmit()

  $('#new_record [name="record[content]"]').simplyCountable
    counter: 'form footer .counter'
    maxCount: newRecordContentMaxLength

  $('#new_record [type=text],textarea').on 'keyup paste cut', () ->
    enableDisableNewRecordSubmit()

  