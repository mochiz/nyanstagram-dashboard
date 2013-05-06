# -*- coding: utf-8 -*-
require 'garb'
require_relative 'base'

module GoogleAnalytics

  # GoogleAnalyticsのイベント情報を取得するためのクラス
  class TotalEvents < Base
    metrics :total_events
    dimensions :event_category, :event_action, :event_label

    private

    # Internal: ランキング配列を返します
    #
    # Array を返します
    def rankings(options = {})
      items = []
      events(options).each_with_index do |event, idx|
        items << { label: event.event_label }
      end
      items
    end

    # Internal: GoogleAnalyticsからの結果セットを返します
    #
    # Garb::ResultSet を返します
    def events(opt = {})
      options = { limit: 10, sort: :total_events.desc }.merge(opt)
      results(options)
    end
  end
end
