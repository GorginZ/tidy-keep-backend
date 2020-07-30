# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Service, type: :model do
  subject { build(:service) }
  context 'validations' do
    it 'has a valid factory' do
      expect(build(:booking)).to be_valid
    end

    it { expect(subject).to validate_presence_of :title }
    it { expect(subject).to validate_presence_of :price }
  end
  context 'associations' do
    it { expect(subject).to have_many(:booking_services) }
    it { expect(subject).to have_many(:bookings).through(:booking_services) }
  end
end
