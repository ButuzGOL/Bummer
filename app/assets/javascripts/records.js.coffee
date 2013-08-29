$ ->
  # _form

  contentMaxLength = 300

  $form = $ '#new_record'
  
  enableDisableSubmit = ->
    $form.find('[type=submit]').prop 'disabled', not (
      $form.find('[name="record[name]"]').val().length and
      $form.find('[name="record[content]"]').val().length and
      $form.find('[name="record[content]"]').val().length <= 
        contentMaxLength and
      Number($form.find('[name="record[stars]"]').val()) isnt 0)

  $form.find('.stars .star').hover(
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

  $form.find('.stars .star').on 'click', (e) ->
    $(@).parent().find('.star').removeClass 'full'
    index = $('.star').index($(@)) + 1
    $(@).parent().find('.star').slice(0, index).addClass 'full'
    $(@).closest('form').find('input[name="record[stars]"]').val index

    enableDisableSubmit()

  $form.find('[name="record[content]"]').simplyCountable
    counter: $form.find '.counter'
    maxCount: contentMaxLength

  $form.find('[type=text],textarea').on 'keyup paste cut', () ->
    enableDisableSubmit()

  $('[data-toggle="modal"][href="#new-discussion"]').on 'click', ->
    $modal = $ '#new-discussion'

    $modal.find('form [name="discussion[record_id]"]').val $(@).attr 'data-id'
    $modal.find('.modal-header .title').text $(@).closest('.record').find('.title span').text()
    $modal.find('form [name="discussion[content]"]').val($.trim($(@).closest('.record').find('.description').text())).trigger 'keyup'