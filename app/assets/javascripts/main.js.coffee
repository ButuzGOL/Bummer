$ ->
  $('#home, #profile').find('#wall header .add, #wall header .remove').on 'click', (e) ->
    t = =>
      $(@).hide();
      $(@).parent().find(if $(@).hasClass 'add' then '.remove' else '.add').show();
    $selector = $(@).closest('section').find('.form').eq(0)

    if $(@).hasClass 'add'
      $selector.slideDown =>
        t()
    else
      $selector.slideUp =>
        t()