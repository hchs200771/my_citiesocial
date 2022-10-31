require 'rails_helper'

RSpec.describe Vendor, type: :model do
  context "Verify title" do
    it "title filled" do
      vendor = Vendor.new(title: 'Hello, world')
      expect(vendor).to be_valid
    end

    it "title not filled" do
      vendor = Vendor.new
      expect(vendor).not_to be_valid
    end
  end
end
