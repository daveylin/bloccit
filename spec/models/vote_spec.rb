require 'rails_helper'

describe Vote do
  
  include TestFactories
  
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
  
  describe 'after_save' do
     it "calls `Post#update_rank` after save" do
       post = associated_post
       vote = Vote.new(value: 1, post: post)
       expect(post).to receive(:update_rank)
       vote.save
     end
  end
end
