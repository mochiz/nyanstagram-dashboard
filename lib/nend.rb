# -*- coding: utf-8 -*-
require 'mechanize'
require 'active_support/core_ext'


class Nend
  def initialize
    # nend parameters
    @url      = ENV['NEND_URL']
    @mail     = ENV['NEND_MAIL']
    @password = ENV['NEND_PASSWORD']
    @agent    = Mechanize.new
  end

  def reward(options = {})
    tds = retrieve_td_attributes(options)
    unless tds[1].text.include?(options[:name])
      return { ctr: 0, ecpm: 0, reward: 0 }
    end
    reward_params(tds)
  end

  private

  def retrieve_td_attributes(options)
    login_page = @agent.get(@url)
    form = login_page.form_with(name: 'loginform') do |form|
      form['data[User][mail]'] = @mail
      form['data[User][pass]'] = @password
    end
    button = form.button_with(name: '')
    top_page = @agent.submit(form, button)

    form = top_page.form_with(name: 'report_search') do |form|
      form['search_date'] = "#{options[:from]} - #{options[:to]}"
    end
    button = form.button_with(name: '')
    page = @agent.submit(form, button)

    page.root.css('table.info tbody').search('td')
  end

  def reward_params(tds)
    {
      ctr: tds[tds.length - 3].text.gsub('％', ''),
      ecpm: tds[tds.length - 2].text.gsub('￥', ''),
      reward: tds[tds.length - 1].text.gsub('￥', ''),
    }
  end

end
