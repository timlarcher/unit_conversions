require 'unit_conversions'
require 'test/unit'

class TestUnitConversions < Test::Unit::TestCase

  @@h = { :inches => 12, :ins => 12,
          :feet => 2, :ft => 2,
          :yards => 1, :yds => 1,
          :miles => 1, :mls => 1,
          :millimeters => 1000, :mm => 1000,
          :centimeters => 100, :cm => 100,
          :meters => 1, :m => 1,
          :kilometers => 1, :km => 1 }

  def test_meters
    assert_in_delta 5228.1884, UnitConversions.meters(@@h), 0.0001, "test_meters"
    assert_in_delta 5228.1884, UnitConversions.m(@@h), 0.0001, "test_m"
    assert_in_delta 5228188.4, UnitConversions.millimeters(@@h), 0.1, "test_millimeters"
    assert_in_delta 5228188.4, UnitConversions.mm(@@h), 0.1, "test_mm"
    assert_in_delta 522818.84, UnitConversions.centimeters(@@h), 0.1, "test_centimeters"
    assert_in_delta 522818.84, UnitConversions.cm(@@h), 0.1, "test_cm"
    assert_in_delta 5.2282, UnitConversions.kilometers(@@h), 0.1, "test_kilometers"
    assert_in_delta 5.2282, UnitConversions.km(@@h), 0.1, "test_km"
  end

  def test_feet
    assert_in_delta 17153.686, UnitConversions.feet(@@h), 1.0, "test_feet"
    assert_in_delta 17153.686, UnitConversions.ft(@@h), 1.0, "test_ft"
    assert_in_delta 17153.686*12, UnitConversions.inches(@@h), 12.0, "test_inches"
    assert_in_delta 17153.686*12, UnitConversions.ins(@@h), 12.0, "test_ins"
    assert_in_delta 17153.686/3, UnitConversions.yards(@@h), 0.5, "test_yards"
    assert_in_delta 17153.686/3, UnitConversions.yds(@@h), 0.5, "test_yds"
    assert_in_delta 17153.686/5280, UnitConversions.miles(@@h), 0.1, "test_miles"
    assert_in_delta 17153.686/5280, UnitConversions.mls(@@h), 0.1, "test_mls"
    assert_in_delta 17153.686/6, UnitConversions.fathoms(@@h), 0.1, "test_fathoms"
    assert_in_delta 17153.686/(3*5280), UnitConversions.leagues(@@h), 0.1, "test_leagues"
  end

  def test_errors
    h = { :inch => 12, :ins => 12 }
    assert_in_delta 1.0, UnitConversions.feet(h), 0.001, "test_feet"
    h = { :badbadbad => 12 }
    assert_in_delta 0.0, UnitConversions.feet(h), 0.001, "test_feet"
    h = {}
    assert_in_delta 0.0, UnitConversions.feet(h), 0.001, "test_feet"
  end

  def test_duplicates
    h = { :inches => 12, :inches => 12 }
    assert_in_delta 1.0, UnitConversions.feet(h), 0.001, "test_feet"
  end



  def test_meters2
    x = { :meters2 => 1, :ft2 => UnitConversions::FEET_PER_METER**2 }
    assert_in_delta 2.0, UnitConversions.meters2(x), 0.0001, "test_meters2"
    assert_in_delta 2.0, UnitConversions.m2(x), 0.0001, "test_m2"
  end

end

