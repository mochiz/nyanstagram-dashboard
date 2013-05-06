# -*- coding: utf-8 -*-

module GoogleAnalytics

  # GoogleAnalytics に便利な日付範囲をサポートするためのメソッドを持つモジュール
  module DateRangeUtil

    # Public: 昨日の日付範囲ハッシュを返します
    #
    # Time オブジェクトの Hash を返します
    def date_range_yesterday
      {
        start_date: 1.day.ago.to_time,
        end_date:   1.day.ago.to_time,
      }
    end

    # Public: 先週の日付範囲ハッシュを返します
    #
    # Time オブジェクトの Hash を返します
    def date_range_last_week
      {
        start_date: 1.week.ago.beginning_of_week.to_time,
        end_date:   1.week.ago.end_of_week.to_time,
      }
    end

    # Public: 先月の日付範囲ハッシュを返します
    #
    # Time オブジェクトの Hash を返します
    def date_range_last_month
      {
        start_date: 1.month.ago.beginning_of_month.to_time,
        end_date:   1.month.ago.end_of_month.to_time,
      }
    end

    # Public: 全ての日付範囲ハッシュを返します
    #
    # Time オブジェクトの Hash を返します
    def date_range_all
      {
        start_date: Time.new(2013, 1, 1),
      }
    end

  end

end
