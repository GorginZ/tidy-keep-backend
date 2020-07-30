# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :request do
  subject { build(:user) }
  it 'responds successfully' do
    get '/status', headers: authenticated_header
    expect(response).to have_http_status(:success)
  end
end
