class Dashing.Reward extends Dashing.Widget
  @accessor 'imps',   Dashing.AnimatedValue
  @accessor 'ctr',    Dashing.AnimatedValue
  @accessor 'ecpm',   Dashing.AnimatedValue
  @accessor 'reward', Dashing.AnimatedValue

  @accessor 'difference', ->
    imps = @get('imps')
    ctr = @get('ctr')
    ecpm = @get('ecpm')
    reward = @get('reward')
