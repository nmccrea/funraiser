require 'spec_helper'

describe ApplicationHelper do
  
  describe '#body_tag_class' do
    
    it 'should return a class composed of the controller name and controller action' do
      controller.stub( :controller_name ).and_return( 'fundraisers' )
      controller.stub( :action_name ).and_return( 'index' )
      helper.body_tag_class.should == 'fundraisers-index'
    end
  end # describe '#body_tag_class'
end
