# -*- coding: utf-8 -*-
require 'spec_helper'
require 'active_support/all'
require 'hashie'

require_relative '../../lib/google_analytics/fav_rankings'

describe GoogleAnalytics::FavRankings do
  subject { GoogleAnalytics::FavRankings }

  describe '#get' do
    let(:rankings) do
      [{ label: 'Nyanstagram' },
       { label: 'アビシニアン' },
       { label: 'musashi' },
       { label: 'キジトラ' },
       { label: 'アメリカンショートヘア' },
      ]
    end
    let(:results) { rankings }

    subject { GoogleAnalytics::FavRankings.get }

    it 'should receive fav rankings' do
      GoogleAnalytics::TotalEvents.any_instance.stub(:rankings).and_return(results)
      should eq(rankings)
    end
  end
end
