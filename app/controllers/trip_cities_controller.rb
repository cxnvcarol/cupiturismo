class TripCitiesController < ApplicationController
  # GET /trip_cities
  # GET /trip_cities.json
  def index
    @trip_cities = TripCity.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @trip_cities }
    end
  end

  # GET /trip_cities/1
  # GET /trip_cities/1.json
  def show
    @trip_city = TripCity.find(params[:id])
    @trip_parent=Trip.find(@trip_city.trip_id)
    @event = Event.new
    @event.trip_city=@trip_city

    respond_to do |format|

      if(@trip_parent.user_id==current_user.id)
        format.html # show.html.erb
      else
        format.html { render action: "show_readonly" }
      end
      format.json { render json: @trip_city }
    end
  end

  def show_readonly
    @trip_city = TripCity.find(params[:id])
    respond_to do |format|
      format.html
    end
  end

  # GET trip_cities/info_events/:trip_city_id.json
  def info_events
    @tripcity = TripCity.find(params[:id])
    @ret_events=@tripcity.events

    respond_to do |format|
      format.json { render json: @ret_events }
    end
  end


  # GET /trip_cities/new
  # GET /trip_cities/new.json
  def new
    @trip_city = TripCity.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @trip_city }
    end
  end

  # GET /trip_cities/1/edit
  def edit
    @trip_city = TripCity.find(params[:id])
  end

  # POST /trip_cities
  # POST /trip_cities.json
  def create
    @trip = Trip.find(params[:trip_id])
    @trip_city = @trip.trip_cities.create(params[:trip_city])

    redirect_to edit_trip_path(@trip)

  end

  # PUT /trip_cities/1
  # PUT /trip_cities/1.json
  def update
    @trip_city = TripCity.find(params[:id])

    respond_to do |format|
      if @trip_city.update_attributes(params[:trip_city])
        format.html { redirect_to @trip_city, notice: 'Trip city was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @trip_city.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /trip_cities/1
  # DELETE /trip_cities/1.json
  def destroy
    @trip_city = TripCity.find(params[:id])
    @trip_id=Trip.find(@trip_city.trip_id)
    @trip_city.destroy

    redirect_to :controller => 'trips', :action => 'show', :id=>@trip_id

  end
end