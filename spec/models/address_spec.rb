# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Address, type: :model do
  subject { build(:address) }

  context 'validations' do
    it 'has a valid factory' do
      expect(build(:address)).to be_valid
    end
    it { expect(subject).to validate_presence_of :street_address }
    it { expect(subject).to validate_presence_of :state }
    it { expect(subject).to validate_presence_of :post_code }
  end

  context 'associations' do
    it { expect(subject).to have_many(:bookings) }
    it { expect(subject).to belong_to(:user) }
  end
end
