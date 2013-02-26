require 'spec_helper'

describe ApplicationHelper do
  
  describe '#body_tag_class' do
    
    it 'should return a class composed of the controller name and controller action' do
      controller.stub( :controller_name ).and_return( 'fundraisers' )
      controller.stub( :action_name ).and_return( 'index' )
      helper.body_tag_class.should == 'fundraisers-index'
    end
  end # describe '#body_tag_class'
  
  describe '#user_is_logged_in?' do
    
    it 'should call the user_is_logged_in? method on the controller and return true if that method returns true' do
      controller.should_receive( :user_is_logged_in? ).and_return( true )
      helper.user_is_logged_in?.should == true
    end
    
    it 'should call the user_is_logged_in? method on the controller and return false if that method returns false' do
      controller.should_receive( :user_is_logged_in? ).and_return( false )
      helper.user_is_logged_in?.should == false
    end
    
    it 'should memoize the response from the controller for the duration of this request, so the controller is only asked once' do
      controller.should_receive( :user_is_logged_in? ).once.and_return( true )
      helper.user_is_logged_in?.should == true
      helper.user_is_logged_in?.should == true
    end
  end # describe '#user_is_logged_in?'
end
