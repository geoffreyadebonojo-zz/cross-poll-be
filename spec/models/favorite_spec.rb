require 'rails_helper'

RSpec.describe Favorite, type: :model do
  describe "Validations" do
    it {should validate_presence_of(:favorite_id) }
  end
end
