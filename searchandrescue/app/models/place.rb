class Place < ApplicationRecord
  mount_uploaders :images, ImageUploader
  serialize :images, JSON # If you use SQLite, add this line.
  
  attr_accessor :name, :latitude, :longitude
  
  # Modified from Paul Faugeras' Computer-Vision-Emergency-Response-Toolkit
  def find_fov(s)
    if(s.class == String)
      case s
        when "FC220"
          return 78.8
        when "FC1102"
          return 81.9
        when "FC200"
          return 85
        when "FC2103"
          return 85
        when "FC300"
          return 94
        when "FC7203"
          return 83
        when "FC330"
          return 94
        when "FC6310S"
          return 84
        when "FC6310"
          return 84
        when "ZENMUSE Z30"
          return 63.7
      end
    else
      return nil
    end
    
  end
  
  def find_sensor_height(s)
    if(s.class == String)
      case s
        when "FC6310S"
          return 8.80
        when "ZENMUSE Z30"
          return 3.556
      end
    else
      return nil
    end

  end
  
  def find_sensor_width(s)
    if(s.class == String)
      case s
        when "FC6310S"
          return 13.20
        when "ZENMUSE Z30"
          return 4.826
      end
    else
      return nil
    end
  end
  
  def get_direction(s)
    if(s > 180 || s < -180)
      return nil
    end
      
    if(s >= -22.5 && s <= 22.5)
      return "E"
    elsif(s > 22.5 && s <= 67.5)
      return "SE"
    elsif(s > 67.5 && s <= 112.5)
      return "S"
    elsif(s > 112.5 && s <= 158.5)
      return "SW"
    elsif(s < -22.5 && s >= -67.5)
      return "NE"
    elsif(s < -67.5 && s >= -112.5)
      return "N"
    elsif(s < -112.5 && s >= -158.5)
      return "NW"
    else
      return "W"
    end
  end
  
end
