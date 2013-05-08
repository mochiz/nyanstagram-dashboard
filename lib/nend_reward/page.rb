# -*- coding: utf-8 -*-
require 'mechanize'

# Nend から報酬情報を取得するためのモジュール
module NendReward

  # Nend の Mechanize::Page を扱うためのクラス
  class Page

    NEND_URL = 'https://www.nend.net/m/adspot/index'

    def initialize(opt)
      @url        = NEND_URL
      @mail       = ENV['NEND_MAIL']
      @password   = ENV['NEND_PASSWORD']
      @from_date  = opt[:from_date] || 1.month.ago.beginning_of_month.strftime('%Y/%m/%d')
      @to_date    = opt[:to_date]   || 1.month.ago.end_of_month.strftime('%Y/%m/%d')
      @date_range = "#{@from_date} - #{@to_date}"
      @agent = Mechanize.new
    end

    # Public: Nendの報酬ページを返します
    #
    # Mechanize::Page を返します
    def get(options = {})
      reward_page
    end

    # Public: Nendの報酬ページを返します
    #
    # Example:
    #
    #   NendReward::Page.get
    #
    # Mechanize::Page を返します
    def self.get(options = {})
      self.new(options).get
    end

    private

    # Internal: Nendの報酬ページを返します
    #
    # Mechanize::Page を返します
    def reward_page
      login!
      get_reward_page
    end

    # Internal: Nendへログインします
    #
    # Mechanize::Page を返します
    def login!
      form = @agent.get(@url).form_with(name: 'loginform') do |form|
        form['data[User][mail]'] = @mail
        form['data[User][pass]'] = @password
      end
      @agent.submit(form)
    end

    # Internal: Nendの報酬ページを返します
    #
    # Mechanize::Page を返します
    def get_reward_page
      form = @agent.get(@url).form_with(name: 'report_search') do |form|
        form['search_date'] = @date_range
      end
      @agent.submit(form)
    end
  end
end
