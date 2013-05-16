# -*- coding: utf-8 -*-
require 'spec_helper'
require 'active_support/all'
require 'hashie'

require_relative '../../lib/google_analytics/new_visits'

describe GoogleAnalytics::NewVisits do
  subject { GoogleAnalytics::NewVisits }

  describe '#get' do
    let(:results) { [Hashie::Mash.new(new_visits: 10)] }
    let(:users) do
      {
        total:     10,
        last_week: 10,
      }
    end
    subject { GoogleAnalytics::NewVisits.get }

    it 'should receive new visits' do
      GoogleAnalytics::Base.any_instance.stub(:results).and_return(results)
      should eq(users)
    end
  end
end
