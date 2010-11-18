require 'conversions'
require 'test/unit'

class TestConversions < Test::Unit::TestCase

  @@h = { :inches => 12, :ins => 12,
          :feet => 2, :ft => 2,
          :yards => 1, :yds => 1,
          :miles => 1, :mls => 1,
          :millimeters => 1000, :mm => 1000,
          :centimeters => 100, :cm => 100,
          :meters => 1, :m => 1,
          :kilometers => 1, :km => 1 }

  def test_meters
    puts self.method_name
    assert_in_delta 5228.1884, Conversions.meters(@@h), 0.0001, "test_meters"
    assert_in_delta 5228.1884, Conversions.m(@@h), 0.0001, "test_m"
    assert_in_delta 5228188.4, Conversions.millimeters(@@h), 0.1, "test_millimeters"
    assert_in_delta 5228188.4, Conversions.mm(@@h), 0.1, "test_mm"
    assert_in_delta 522818.84, Conversions.centimeters(@@h), 0.1, "test_centimeters"
    assert_in_delta 522818.84, Conversions.cm(@@h), 0.1, "test_cm"
    assert_in_delta 5.2282, Conversions.kilometers(@@h), 0.1, "test_kilometers"
    assert_in_delta 5.2282, Conversions.km(@@h), 0.1, "test_km"
  end

  def test_feet
    puts self.method_name
    assert_in_delta 17153.686, Conversions.feet(@@h), 1.0, "test_feet"
    assert_in_delta 17153.686, Conversions.ft(@@h), 1.0, "test_ft"
    assert_in_delta 17153.686*12, Conversions.inches(@@h), 12.0, "test_inches"
    assert_in_delta 17153.686*12, Conversions.ins(@@h), 12.0, "test_ins"
    assert_in_delta 17153.686/3, Conversions.yards(@@h), 0.5, "test_yards"
    assert_in_delta 17153.686/3, Conversions.yds(@@h), 0.5, "test_yds"
    assert_in_delta 17153.686/5280, Conversions.miles(@@h), 0.1, "test_miles"
    assert_in_delta 17153.686/5280, Conversions.mls(@@h), 0.1, "test_mls"
    assert_in_delta 17153.686/6, Conversions.fathoms(@@h), 0.1, "test_fathoms"
    assert_in_delta 17153.686/(3*5280), Conversions.leagues(@@h), 0.1, "test_leagues"
  end

  def test_errors
    puts self.method_name
    h = { :inch => 12, :ins => 12 }
    assert_in_delta 1.0, Conversions.feet(h), 0.001, "test_feet"
    h = { :badbadbad => 12 }
    assert_in_delta 0.0, Conversions.feet(h), 0.001, "test_feet"
    h = {}
    assert_in_delta 0.0, Conversions.feet(h), 0.001, "test_feet"
  end

  def test_duplicates
    puts self.method_name
    h = { :inches => 12, :inches => 12 }
    assert_in_delta 1.0, Conversions.feet(h), 0.001, "test_feet"
  end

end

