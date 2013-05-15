# -*- coding: utf-8 -*-

SCHEDULER.every '15m', first_in: 0 do
  # ユーザー数
  send_event('user', GoogleAnalytics::NewVisits.get)

  # スクリーンビュー数
  send_event('screen_view', GoogleAnalytics::AppViews.get)

  # 検索TOP10
  send_event('search_ranking', { items: GoogleAnalytics::SearchRankings.get })

  # お気に入りTOP10
  send_event('favorite_ranking', { items: GoogleAnalytics::FavRankings.get })
end
