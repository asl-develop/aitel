# coding: utf-8
require 'spec_helper'

describe ReserveDecorator do
  let(:reserve) { Reserve.new.extend ReserveDecorator }
  subject { reserve }
  it { should be_a Reserve }
end
