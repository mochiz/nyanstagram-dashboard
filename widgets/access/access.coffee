class Dashing.Access extends Dashing.Widget
  @accessor 'last_day', Dashing.AnimatedValue
  @accessor 'last_week', Dashing.AnimatedValue
  @accessor 'last_month', Dashing.AnimatedValue

  @accessor 'difference', ->
    last_day = @get('last_day')
    last_week = @get('last_week')
    last_month = @get('last_month')
