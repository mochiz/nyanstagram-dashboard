# -*- coding: utf-8 -*-
require 'garb'
require_relative 'base'

module GoogleAnalytics

  # GoogleAnalytics のページビューを取得するためのクラス
  class AppViews < Base
    metrics :appviews

    # Public: アクセス数のハッシュを返します
    #
    # Examples
    #
    #   # アクセス数のハッシュを取得
    #   GoogleAnalytics::PageViews.get
    #
    # 以下のような Hash を返します。
    #   {
    #     last_day: 昨日のアクセス数String,
    #     last_week: 先週のアクセス数String,
    #     last_month: 先月のアクセス数String,
    #   }
    def self.get
      self.new.accesses
    end

    # Public: アクセス数のハッシュを返します
    #
    # 以下のような Hash を返します。
    #   {
    #     last_day: 昨日のアクセス数String,
    #     last_week: 先週のアクセス数String,
    #     last_month: 先月のアクセス数String,
    #   }
    def accesses
      {
        last_day:   appviews(date_range_yesterday),
        last_week:  appviews(date_range_last_week),
        last_month: appviews(date_range_last_month),
      }
    end

    private

    # Internal: アクセス数を返します
    #
    # options - 日付範囲を指定するためのハッシュ
    #
    # Stringを返します
    def appviews(opt = {})
      options = {limit: 1}.merge(opt)
      results(options).first.appviews
    end
  end
end
