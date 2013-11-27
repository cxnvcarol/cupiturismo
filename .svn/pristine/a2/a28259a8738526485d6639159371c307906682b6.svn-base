require 'test_helper'

class TripTest < ActiveSupport::TestCase
   test "cant add trip, date before now" do
     assert trips(:antes).begin_date => (Time.now )
   end

   test "delete trip" do
     @trip = Trip.find_by_tittle('trip1')
     @trip.destroy
     assert !@trip1=Trip.find_by_tittle('trip1')
     assert @trip2=Trip.find_by_tittle('trip2')
   end

  test "view trip" do
    assert !@trip = Trip.find_by_tittle('trip nonexistent')
    @trip = Trip.find_by_tittle('trip2')
    assert @tit = @trip.tittle
    assert @beg = @trip.begin_date
    assert @use = @trip.user_id
    assert @end = @trip.end_date



  end

end
