# -*- coding: utf-8 -*-

SCHEDULER.every '15m', first_in: 0 do
  format = '%Y/%m/%d'
  from   = 1.month.ago.beginning_of_month.strftime(format)
  to     = 1.month.ago.end_of_month.strftime(format)
  reward = Nend.new.reward(name: 'Nyanstagram', from: from, to: to)

  # 報酬
  send_event('reward', reward)
end
