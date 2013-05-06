class Dashing.Reward extends Dashing.Widget
  @accessor 'ctr', Dashing.AnimatedValue
  @accessor 'ecpm', Dashing.AnimatedValue
  @accessor 'reward', Dashing.AnimatedValue

  @accessor 'difference', ->
    ctr = @get('ctr')
    ecpm = @get('ecpm')
    reward = @get('reward')
