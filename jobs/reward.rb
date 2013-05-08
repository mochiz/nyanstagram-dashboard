# -*- coding: utf-8 -*-

SCHEDULER.every '15m', first_in: 0 do
  # 先月の収益
  send_event('last_month_reward', NendReward::Reward.get)

  # 今月の収益
  options = {
    from_date: Time.new.beginning_of_month.strftime('%Y/%m/%d'),
    to_date:   Time.new.end_of_month.strftime('%Y/%m/%d'),
  }
  send_event('this_month_reward', NendReward::Reward.get(options))
end
