$ ->
  # _form

  contentMaxLength = 300

  $form = $ '#new_comment'

  enableDisableSubmit = ->

    $form.find('[type=submit]').prop 'disabled', not (
      $form.find('[name="comment[content]"]').val().length and
      $form.find('[name="comment[content]"]').val().length <= 
        contentMaxLength)

  $form.find('[name="comment[content]"]').simplyCountable
    counter: $form.find '.counter'
    maxCount: contentMaxLength

  $form.find('textarea').on 'keyup paste cut', () ->
    enableDisableSubmit()