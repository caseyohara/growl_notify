require 'spec_helper'
ICON = File.join(File.expand_path('../', __FILE__), 'growl_icon.png')
describe GrowlNotify do
  it "should reset the configs" do
    GrowlNotify.config do |config|
      config.notifications = config.default_notifications = ["foo"]
      config.application_name = config.notifications.first
    end
    GrowlNotify.notifications.should == ["foo"]
    GrowlNotify.reset!
    GrowlNotify.notifications.should be_nil
  end
  after :each do
    GrowlNotify.reset!
  end
  
  context 'default' do
    before do
      GrowlNotify.config do |config|
        config.notifications = config.default_notifications = ["Compass Application"]
        config.application_name = config.notifications.first
      end
    end
  
    it "should send a growl notification with icon" do
      GrowlNotify.send_notification(:title => 'GrowlNotify Spec', :description => 'This is my descripton', :icon => ICON).should be_nil
    end
  end
  
  context 'no icon' do
    before do
      GrowlNotify.config do |config|
        config.notifications = config.default_notifications = ["Compass Application"]
        config.application_name = config.notifications.first
      end
    end
  
    it "should send a growl notification with icon" do
      GrowlNotify.send_notification(:title => 'GrowlNotify Spec', :description => 'This is my descripton no icon').should be_nil
    end
  end
  
  context 'config with icon' do
     before do
        GrowlNotify.config do |config|
          config.notifications = config.default_notifications = ["Compass Application"]
          config.application_name = config.notifications.first
          config.icon = ICON
        end
      end

      it "should send a growl notification with icon" do
        GrowlNotify.send_notification(:title => 'GrowlNotify Spec', :description => 'This is my descripton with a global icon').should be_nil
      end
  end
  
  context "helper methods" do
    before do
       GrowlNotify.config do |config|
         config.notifications = config.default_notifications = ["Compass Application"]
         config.application_name = config.notifications.first
         config.icon = ICON
       end
     end

     it "should send 'very low'" do
       GrowlNotify.very_low(:title => 'GrowlNotify Spec', :description => 'This is my "very_low" message').should be_nil
     end
     
     it "should send 'moderate'" do
       GrowlNotify.moderate(:title => 'GrowlNotify Spec', :description => 'This is my "moderate" message').should be_nil
     end
     
     it "should send 'normal'" do
       GrowlNotify.normal(:title => 'GrowlNotify Spec', :description => 'This is my "normal" message').should be_nil
     end
     
     it "should send 'high'" do
       GrowlNotify.high(:title => 'GrowlNotify Spec', :description => 'This is my "high" message').should be_nil
     end
     
     it "should send 'emergency'" do
       GrowlNotify.emergency(:title => 'GrowlNotify Spec', :description => 'This is my "emergency" message').should be_nil
     end
     
     it "should send 'sticky'" do
       GrowlNotify.sticky!(:title => 'GrowlNotify Spec', :description => 'This is my "Sticky!" message').should be_nil
     end
     
  end
  
end