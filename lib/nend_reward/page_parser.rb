# -*- coding: utf-8 -*-

# Nend から報酬情報を取得するためのモジュール
module NendReward

  # Nend の Mechanize::Page をパースするためのクラス
  class PageParser

    def initialize(page, name)
      @page = page
      @name = name
    end

    # Public: Nendページをパースしてアプリの報酬情報を返します
    #
    # 以下のようなハッシュを返します。
    #   {
    #     imps:   インプレッション数
    #     clicks: クリック数
    #     ctr:    CTR
    #     ecpm:   eCPM（円/1000imps）
    #     reward: 報酬額
    #   }
    def parsed_reward
      parsed_params
    end

    # Public: Nendページをパースしてアプリの報酬情報を返します
    #
    # Examples
    #
    #   # ユーザー数のハッシュを取得
    #   NendReward::PageParser.parsed_reward(page, name)
    #
    # Hash を返します。
    def self.parsed_reward(page, name)
      self.new(page, name).parsed_reward
    end

    private

    # Internal: Nendページをパースしてアプリの報酬情報を返します
    #
    # 以下のような Hash を返します。
    #   {
    #     imps:   インプレッション数
    #     clicks: クリック数
    #     ctr:    CTR
    #     ecpm:   eCPM（円/1000imps）
    #     reward: 報酬額
    #   }
    def parsed_params
      tds = @page.root.css('table.info tbody').search('td')
      unless tds[1].text.include?(@name)
        return { ctr: 0, ecpm: 0, reward: 0 }
      end
      {
        imps:   tds[tds.length - 5].text,
        clicks: tds[tds.length - 4].text,
        ctr:    tds[tds.length - 3].text.gsub('％', ''),
        ecpm:   tds[tds.length - 2].text.gsub('￥', ''),
        reward: tds[tds.length - 1].text.gsub(/￥|,/, ''),
      }
    end
  end
end
