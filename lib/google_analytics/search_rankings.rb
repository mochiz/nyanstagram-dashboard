# -*- coding: utf-8 -*-
require 'garb'
require_relative 'total_events'

module GoogleAnalytics

  # 検索ランキングを取得するためのクラス
  class SearchRankings < TotalEvents
    metrics :total_events
    dimensions :event_category, :event_action, :event_label

    EVENT_ACTION_STRING = 'タグ検索'

    # Public: 先月のタグ検索ランキング配列を返します
    #
    # Examples
    #
    #   # ユーザー数のハッシュを取得
    #   GoogleAnalytics::SearchRankings.get
    #
    # 以下のような配列を返します。
    #   [{ label: 'Nyanstagram' },
    #    { label: 'アビシニアン' },
    #    { label: 'musashi' },
    #    { label: 'キジトラ' },
    #    { label: 'アメリカンショートヘア' },
    #   ]
    def self.get
      self.new.last_month_search_rankings
    end

    # Public: 先月のタグ検索ランキング配列を返します
    #
    # 以下のような配列を返します。
    #   [{ label: 'Nyanstagram' },
    #    { label: 'アビシニアン' },
    #    { label: 'musashi' },
    #    { label: 'キジトラ' },
    #    { label: 'アメリカンショートヘア' },
    #   ]
    def last_month_search_rankings
      options = { filters: { :event_action.eql => EVENT_ACTION_STRING } } \
        .merge(date_range_last_month)
      rankings(options)
    end
  end
end
