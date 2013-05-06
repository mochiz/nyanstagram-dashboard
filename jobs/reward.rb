# -*- coding: utf-8 -*-

SCHEDULER.every '15m', first_in: 0 do
  # 先月の収益
  send_event('reward', NendReward::Reward.get)
end
