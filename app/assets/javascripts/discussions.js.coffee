$ ->
  # _form

  newDiscussionContentMaxLength = 300

  $form = $ '#new_discussion'

  enableDisableNewDiscussionSubmit = ->

    $form.find('[type=submit]').prop 'disabled', not (
      $form.find('[name="discussion[content]"]').val().length and
      $form.find('[name="discussion[content]"]').val().length <= 
        newDiscussionContentMaxLength)

  $form.find('[name="discussion[content]"]').simplyCountable
    counter: 'form footer .counter'
    maxCount: newDiscussionContentMaxLength

  $form.find('[type=text],textarea').on 'keyup paste cut', () ->
    enableDisableNewDiscussionSubmit()
