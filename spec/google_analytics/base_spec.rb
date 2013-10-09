# -*- coding: utf-8 -*-
require 'spec_helper'
require_relative '../../lib/google_analytics/base'

describe GoogleAnalytics::Base do
  let(:base) { GoogleAnalytics::Base.new }
  subject { base }

  it { should be_an_instance_of(GoogleAnalytics::Base) }
  its(:get) { should be_an_instance_of(Garb::ResultSet) }
end
