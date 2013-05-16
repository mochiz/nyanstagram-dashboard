# -*- coding: utf-8 -*-
require 'spec_helper'
require 'active_support/all'
require 'hashie'

require_relative '../../lib/nend_reward/reward'

describe NendReward::Reward do

  describe '#get' do
    let(:reward) do
      {
        imps:   10,
        clicks: 10,
        ctr:    10,
        ecpm:   10,
        reward: 10,
      }
    end
    let(:results) { reward }

    subject { NendReward::Reward.get }

    it 'should receive reward' do
      NendReward::Page.any_instance.stub(:get).and_return(Mechanize::Page.new)
      NendReward::PageParser.any_instance.stub(:parsed_reward).and_return(reward)
      should eq(reward)
    end
  end
end
