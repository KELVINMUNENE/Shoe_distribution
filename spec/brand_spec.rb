
require "spec_helper"

describe Brand, type: :model do
  it { should have_and_belong_to_many :stores }
  it "validates presence of name" do
    test_brand = Brand.create({name: ""})
    expect(test_brand.save).to eq(false)
  end
end


