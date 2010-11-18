module Conversions

# Length
  FEET_PER_METER = 3.281
  METERS_PER_FOOT = 1/FEET_PER_METER
  FEET_PER_MILE = 5280.0
  MILES_PER_FOOT = 1/FEET_PER_MILE
  FEET_PER_YARD = 3.0
  YARDS_PER_FOOT = 1/FEET_PER_YARD
  INCHES_PER_FOOT = 12.0
  FEET_PER_INCH = 1/INCHES_PER_FOOT

  INCHES_PER_METER = FEET_PER_METER*INCHES_PER_FOOT
  METERS_PER_INCH = 1/INCHES_PER_METER
  METERS_PER_YARD = FEET_PER_YARD*FEET_PER_METER
  YARDS_PER_METER = 1/METERS_PER_YARD
  INCHES_PER_MILE = INCHES_PER_FOOT * FEET_PER_MILE
  MILES_PER_INCH = 1/INCHES_PER_MILE
  METERS_PER_MILE = FEET_PER_MILE/FEET_PER_METER
  MILES_PER_METER = 1/METERS_PER_MILE

  MILLIMETERS_PER_METER = 1000
  METERS_PER_MILLIMETER = 1/MILLIMETERS_PER_METER
  MILLIMETERS_PER_CENTIMETER = 10
  CENTIMETERS_PER_MILLIMETER = 1/MILLIMETERS_PER_CENTIMETER
  MILLIMETERS_PER_KILOMETER = 1000*1000
  KILOMETERS_PER_MILLIMETER = 1/MILLIMETERS_PER_KILOMETER
  CENTIMETERS_PER_METER = 100
  METERS_PER_CENTIMETER = 1/CENTIMETERS_PER_METER
  METERS_PER_KILOMETER = 1000
  KILOMETERS_PER_METER = 1/METERS_PER_KILOMETER

  FEET_PER_FATHOM = 2*FEET_PER_YARD
  FATHOMS_PER_FOOT = 1/FEET_PER_FATHOM
  FEET_PER_LEAGUE = 3*FEET_PER_MILE
  LEAGUES_PER_FOOT = 1/FEET_PER_LEAGUE


  def self.meters( p )
    a = mm_ft(p)
    a[:ft]/FEET_PER_METER + a[:mm]/MILLIMETERS_PER_METER
  end
  def self.m( p )
    meters p
  end

  def self.millimeters( p )
    meters(p) * MILLIMETERS_PER_METER
  end
  def self.mm( p )
    millimeters p
  end

  def self.centimeters( p )
    meters(p) * CENTIMETERS_PER_METER
  end
  def self.cm( p )
    centimeters p
  end

  def self.kilometers( p )
    meters(p) / METERS_PER_KILOMETER
  end
  def self.km( p )
    kilometers p
  end


  def self.feet( p )
    a = mm_ft(p)
    a[:ft] + a[:mm]/MILLIMETERS_PER_METER*FEET_PER_METER
  end
  def self.ft(p)
    feet p
  end

  def self.inches( p )
    feet(p) * INCHES_PER_FOOT
  end
  def self.ins( p )
    inches p
  end

  def self.yards( p )
    feet(p) * YARDS_PER_FOOT
  end
  def self.yds( p )
    yards p
  end

  def self.miles( p )
    feet(p) * MILES_PER_FOOT
  end
  def self.mls( p )
    miles p
  end

  def self.fathoms( p )
    feet(p) / FEET_PER_FATHOM
  end

  def self.leagues( p )
    feet(p) / FEET_PER_LEAGUE
  end

# Area

  def meters_square

  end


# Volume




private

  def self.mm_ft ( p )
    feet = ((p[:inches] ||= 0) + (p[:ins] ||= 0)) * FEET_PER_INCH
    feet = feet + (p[:feet] ||= 0) + (p[:ft] ||= 0)
    feet = feet + ((p[:yards] ||= 0) + (p[:yds] ||= 0)) * FEET_PER_YARD
    feet = feet + ((p[:miles] ||= 0) + (p[:mls] ||= 0)) * FEET_PER_MILE
    mm = (p[:millimeters] ||= 0) + (p[:mm] ||= 0)
    mm = mm + ((p[:centimeters] ||= 0) + (p[:cm] ||= 0)) * MILLIMETERS_PER_CENTIMETER
    mm = mm + ((p[:meters] ||= 0) + (p[:m] ||= 0)) * MILLIMETERS_PER_METER
    mm = mm + ((p[:kilometers] ||= 0) + (p[:km] ||= 0)) * MILLIMETERS_PER_KILOMETER
    { :mm => mm, :ft => feet }
  end

end