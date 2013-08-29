$ ->
  # _form

  contentMaxLength = 300

  $form = $ '#new_discussion'

  enableDisableSubmit = ->

    $form.find('[type=submit]').prop 'disabled', not (
      $form.find('[name="discussion[content]"]').val().length and
      $form.find('[name="discussion[content]"]').val().length <= 
        contentMaxLength)

  $form.find('[name="discussion[content]"]').simplyCountable
    counter: $form.find '.counter'
    maxCount: contentMaxLength

  $form.find('[type=text],textarea').on 'keyup paste cut', () ->
    enableDisableSubmit()
