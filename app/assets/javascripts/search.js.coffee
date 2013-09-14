$ ->  
  $('#search-submit').on 'click', (e) ->
    $parent = $(@).closest 'li'
    $form = $parent.find 'form'
    $input = $form.find 'input[name="[query]"]'
    
    if $input.is(':visible')
      $form.submit()
    else
      $input.show().animate
        width: '150px'

  $('#search-form').on 'submit', (e) ->
    $input = $(@).find 'input[name="[query]"]'

    e.preventDefault() if $input.val().length < 3