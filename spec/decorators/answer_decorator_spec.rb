# coding: utf-8
require 'spec_helper'

describe AnswerDecorator do
  let(:answer) { Answer.new.extend AnswerDecorator }
  subject { answer }
  it { should be_a Answer }
end
