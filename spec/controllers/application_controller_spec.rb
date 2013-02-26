require 'spec_helper'

describe ApplicationController do
  
  describe '#login' do
    
    it 'should set the current_user_id in the session object to the id of the given user' do
      user = User.create( username: 'johndoe', password: 'password' )
      session[:current_user_id].should be_nil
      controller.login( user )
      session[:current_user_id].should == user.id
    end
  end # describe '#login'
  
  describe '#logout' do
    
    it 'should remove the current_user_id in the session object' do
      user = User.create( username: 'johndoe', password: 'password' )
      controller.login( user )
      session[:current_user_id].should == user.id
      controller.logout
      session[:current_user_id].should be_nil
    end
  end # describe '#logout'
  
  describe '#current_user' do
    
    it 'should return the user object of the logged-in user' do
      user = User.create( username: 'johndoe', password: 'password' )
      controller.login( user )
      controller.current_user.should == user
    end
    
    it 'should return nil if no user is logged in' do
      session[:current_user_id].should be_nil
      controller.current_user.should be_nil
    end
  end # describe '#current_user'
  
  describe '#user_is_logged_in' do
    
    it 'should return true if current_user_id is set in the session object' do
      user = User.create( username: 'johndoe', password: 'password' )
      controller.login( user )
      session[:current_user_id].should == user.id
      controller.user_is_logged_in.should == true
    end
    
    it 'should return false if the current_user_id is not set in the session object' do
      session[:current_user_id].should be_nil
      controller.user_is_logged_in.should == false
    end
  end # describe '#user_is_logged_in'
  
  describe '#authorize_current_page' do
    
    it 'should return true if the current page belongs to the currently logged-in user' do
      fail
    end
    
    it 'should return false if the current page does not belong to the currently logged-in user' do
      fail
    end
    
    it 'should return false if there is no user currently logged in' do
      fail
    end
  end # describe '#authorize_current_page'
end
