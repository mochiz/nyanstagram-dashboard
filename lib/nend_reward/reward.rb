# -*- coding: utf-8 -*-
require 'active_support/core_ext'
require_relative 'page'
require_relative 'page_parser'

# Nend から報酬情報を取得するためのモジュール
module NendReward

  # Nendから情報を取得するためのクラス
  class Reward

    APP_NAME = 'Nyanstagram'

    # Public: Nend報酬情報のハッシュを返します
    #
    # Hash を返します。
    def get(options = {})
      reward(options)
    end

    # Public: Nend報酬情報のハッシュを返します
    #
    # 以下のような Hash を返します。
    #   {
    #     imps:   インプレッション数
    #     clicks: クリック数
    #     ctr:    CTR
    #     ecpm:   eCPM（円/1000imps）
    #     reward: 報酬額
    #   }
    def self.get(options = {})
      self.new.get(options)
    end

    private

    # Internal: Nend報酬情報のハッシュを返します
    #
    # 以下のような Hash を返します。
    #   {
    #     imps:   インプレッション数
    #     clicks: クリック数
    #     ctr:    CTR
    #     ecpm:   eCPM（円/1000imps）
    #     reward: 報酬額
    #   }
    def reward(opt = {})
      page = NendReward::Page.get
      NendReward::PageParser.parsed_reward(page, APP_NAME)
    end
  end
end
