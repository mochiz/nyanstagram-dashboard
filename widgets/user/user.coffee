class Dashing.User extends Dashing.Widget
  @accessor 'total', Dashing.AnimatedValue
  @accessor 'last_week', Dashing.AnimatedValue

  @accessor 'difference', ->
    if @get('last_week')
      last_week = parseInt(@get('last_week'))
      total = parseInt(@get('total'))
      if last_week != 0
        "#{last_week}"
    else
      ""

  @accessor 'arrow', ->
    if @get('last_week')
      'icon-arrow-up'
