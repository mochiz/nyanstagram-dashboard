# -*- coding: utf-8 -*-
require 'garb'
require_relative 'date_range_util'

# GoogleAnalyticsから情報を取得するためのモジュール
module GoogleAnalytics

  # ベースクラス
  #
  # GoogleAnalyticsクラスの共通メソッドを保持します
  #
  class Base
    include GoogleAnalytics::DateRangeUtil
    extend Garb::Model
    metrics :pageviews

    def initialize
      username = ENV['GA_USERNAME']
      password = ENV['GA_PASSWORD']
      ua_code  = ENV['GA_UA_CODE']
      Garb::Session.login(username, password)
      @profile = Garb::Management::Profile.all.detect {|p| p.web_property_id == ua_code}
    end

    # Public: GoogleAnalyticsからの結果セットを返します
    #
    # option - オプションハッシュ
    #
    # Garb::ResultSet を返します
    def get(options = {})
      results(options)
    end

    private

    # Internal: GoogleAnalyticsからの結果セットを返します
    #
    # option - オプションハッシュ
    #
    # Garb::ResultSet を返します
    def results(options = {})
      self.class.results(@profile, options)
    end
  end
end
