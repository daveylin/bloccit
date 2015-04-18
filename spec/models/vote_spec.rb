require 'rails_helper'

describe Vote do
  describe "validations" do
    describe "value validation" do
      it "only allows -1 or 1 as values" do
        
        v1 = Vote.new
        v1.value = 2
        expect(v1.valid?).to eq(false)
        
        v2 = Vote.new
        v2.value = 1
        expect(v2.valid?).to eq(true)
        
      end
    end
  end
end
