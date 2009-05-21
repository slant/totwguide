class LoadNanoData < ActiveRecord::Migration
  def self.up
    Nano.create( 
      [
        {
          :name => "Blessing of the Immortal",
          :url => "205580"
        },    
        {
          :name => "Boon of the Immortal",
          :url => "205582"
        },    
        {
          :name => "Cataclysm of the Immortal",
          :url => "205391"
        },    
        {
          :name => "Chant of the Immortal",
          :url => "205578"
        },    
        {
          :name => "Devastation of the Immortal",
          :url => "205389"
        },    
        {
          :name => "Gift of the Immortal",
          :url => "205584"
        },    
        {
          :name => "Ire of the Immortal",
          :url => "205379"
        },    
        {
          :name => "Mighty Challenger to Cyclops",
          :url => "49744"
        },    
        {
          :name => "Minor Shutdown",
          :url => "205600"
        },    
        {
          :name => "Presence of the Immortal",
          :url => "205574"
        },    
        {
          :name => "Rage of the Immortal",
          :url => "205383"
        },    
        {
          :name => "Resentment of the Immortal",
          :url => "205397"
        },    
        {
          :name => "Smother Fury",
          :url => "205602"
        },    
        {
          :name => "Virulence of the Immortal",
          :url => "205561"
        }
      ]
    )
  end

  def self.down
    Nano.delete_all
  end
end
