$(document).ready ->
  $('#home header .add, #home header .remove').on 'click', (e) ->
    t = =>
      $(@).hide();
      $(@).parent().find(if $(@).hasClass 'add' then '.remove' else '.add').show();
    $selector = $(@).closest('section').find('.form')

    if $(@).hasClass 'add'
      $selector.slideDown =>
        t()
    else
      $selector.slideUp =>
        t()