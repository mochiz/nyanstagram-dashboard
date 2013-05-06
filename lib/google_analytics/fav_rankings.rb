# -*- coding: utf-8 -*-
require 'garb'
require_relative 'total_events'

module GoogleAnalytics

  # お気に入りランキングを取得するためのクラス
  class FavRankings < TotalEvents
    metrics :total_events
    dimensions :event_category, :event_action, :event_label

    EVENT_ACTION_STRING = 'お気に入り追加'

    # Public: 先月のお気に入りランキング配列を返します
    #
    # Examples
    #
    #   # ユーザー数のハッシュを取得
    #   GoogleAnalytics::FavRankings.get
    #
    # 以下のような配列を返します。
    #   [{ label: 'Nyanstagram' },
    #    { label: 'アビシニアン' },
    #    { label: 'musashi' },
    #    { label: 'キジトラ' },
    #    { label: 'アメリカンショートヘア' },
    #   ]
    def self.get
      self.new.last_month_fav_rankings
    end

    # Public: 先月のお気に入りランキング配列を返します
    #
    # 以下のような配列を返します。
    #   [{ label: 'Nyanstagram' },
    #    { label: 'アビシニアン' },
    #    { label: 'musashi' },
    #    { label: 'キジトラ' },
    #    { label: 'アメリカンショートヘア' },
    #   ]
    def last_month_fav_rankings
      options = { filters: { :event_action.eql => EVENT_ACTION_STRING } } \
        .merge(date_range_last_month)
      rankings(options)
    end
  end
end
