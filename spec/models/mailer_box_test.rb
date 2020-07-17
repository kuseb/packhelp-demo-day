require 'rails_helper'

RSpec.describe MailerBox, type: :model do
  describe 'validations' do
    subject { FactoryBot.create :mailer_box }
    it { is_expected.to validate_presence_of :minimum_quantity }
    it { is_expected.to validate_presence_of :maximum_quantity }
    it { is_expected.to validate_presence_of :product_attributes }
    
    it { should_not allow_value(-2).for(:minimum_quantity) }
    it { should_not allow_value(105).for(:maximum_quantity) }
    it { should allow_value(200).for(:minimum_quantity) }
    it { should allow_value(1001).for(:minimum_quantity) }

    it { should_not allow_value(-2).for(:maximum_quantity) }
    it { should_not allow_value(105).for(:maximum_quantity) }
    it { should allow_value(200).for(:maximum_quantity) }
    it { should allow_value(1001).for(:maximum_quantity) }

    it { should allow_value(205).for(:height) }
    it { should allow_value(1000).for(:height) }
    it { should_not allow_value(-2).for(:height) }
    it { should_not allow_value(199).for(:height) }
    it { should_not allow_value(1001).for(:height) }

    it { should allow_value(205).for(:width) }
    it { should allow_value(1000).for(:width) }
    it { should_not allow_value(-2).for(:width) }
    it { should_not allow_value(199).for(:width) }
    it { should_not allow_value(1001).for(:width) }

    it { should allow_value(205).for(:length) }
    it { should allow_value(1000).for(:length) }
    it { should_not allow_value(-2).for(:length) }
    it { should_not allow_value(199).for(:length) }
    it { should_not allow_value(1001).for(:length) }
  end
end

