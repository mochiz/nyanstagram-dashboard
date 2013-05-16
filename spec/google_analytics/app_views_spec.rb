# -*- coding: utf-8 -*-
require 'spec_helper'
require 'active_support/all'
require 'hashie'

require_relative '../../lib/google_analytics/app_views'

describe GoogleAnalytics::AppViews do
  subject { GoogleAnalytics::AppViews }

  describe '#get' do
    let(:results) { [Hashie::Mash.new(appviews: 10)] }
    let(:accesses) do
      {
        last_day:   10,
        last_week:  10,
        last_month: 10,
      }
    end
    subject { GoogleAnalytics::AppViews.get }

    it 'should receive accesses' do
      GoogleAnalytics::Base.any_instance.stub(:results).and_return(results)
      should eq(accesses)
    end
  end
end
