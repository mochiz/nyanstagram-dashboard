# -*- coding: utf-8 -*-
require 'garb'
require_relative 'base'

module GoogleAnalytics

  # GoogleAnalyticsの新規ユーザー数を取得するためのクラス
  class NewVisits < Base

    metrics :new_visits

    # Public: ユーザー数のハッシュを返します
    #
    # Examples
    #
    #   # ユーザー数のハッシュを取得
    #   GoogleAnalytics::NewVisits.get
    #
    # 以下のようなHashを返します。
    #   {
    #     total: ユーザー数
    #     last_week: 先週の新規ユーザー数
    #   }
    def self.get
      self.new.users
    end

    # Public: ユーザー数のハッシュを返します
    #
    # 以下のようなHashを返します。
    #   {
    #     total: ユーザー数
    #     last_week: 先週の新規ユーザー数
    #   }
    def users
      {
        total:     new_visits(date_range_all),
        last_week: new_visits(date_range_last_week),
      }
    end

    private

    # Internal: ユーザー数のハッシュを返します
    #
    # Hash を返します
    def new_visits(opt = {})
      options = { limit: 1 }.merge(opt)
      results(options).first.new_visits
    end
  end
end
