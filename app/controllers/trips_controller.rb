class TripsController < ApplicationController
  before_filter :authenticate_user!
  # GET /trips
  # GET /trips.json
  def index
    @trip = Trip.new
    @trips = Trip.find_all_by_user_id(current_user.id)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @trips }
    end
  end

  def all
    @trip = Trip.new
    @trips = Trip.find_all_by_private(false)

    respond_to do |format|
      format.html
      format.json { render json: @trips }
    end
  end

  def upload_photo

    @trip=Trip.find(params[:trip_id])
    unless params[:photo].nil?
      @photo=Photo.create(params[:photo])
      @photo.trip_id=params[:trip_id]
      @photo.save
  end
  redirect_to edit_trip_path(@trip)
  end

  # GET trips/info_events/trip_id.json?date_param=dd-mm-yyyy
  def info_events
    @trip = Trip.find(params[:id])
    date_param=Date.strptime(params[:date_param],"%d-%m-%Y")
    @ret_events=[]
    @trip.trip_cities.each  do |trip_city|
        @tempo_ev=Event.where("trip_city_id =? and begin_date >= ? and end_date <?",trip_city.id,date_param,date_param+1.day).as_json()
      @ret_events.push(@tempo_ev)
    end

    respond_to do |format|
      format.json { render json: @ret_events }
    end
  end


  # GET trips/all_events/trip_id.json
  def all_events
    @trip = Trip.find(params[:id])
    @ret_events=[]
    @trip.trip_cities.each  do |trip_city|
      @tempo_ev=trip_city.events
        @tempo_ev.each do |ev|
          @ret_events.push(ev.to_json(:include => :place))
        end
    end

    respond_to do |format|
      format.json { render json: @ret_events }
    end
  end

  # GET /trips/1
  # GET /trips/1.json
  def show
    @trip = Trip.find(params[:id])

    respond_to do |format|
        format.html # show.html.erb
      format.json { render json: @trip }
    end
  end

  def share
    @trip = Trip.find(params[:id])

    respond_to do |format|
      format.html # share.html.erb
      format.json { render json: @trip }
    end
  end

  def sendMail
    recipient = params[:mailD]
    subject = "A trip has been shared to you"
    message = params[:msg]
    UserMailer.contact(recipient, subject, message).deliver
    redirect_to (trips_path)
   end


  # GET /trips/new
  # GET /trips/new.json
  def new
    @trip = Trip.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @trip }
    end
  end

  # GET /trips/1/edit
  def edit
    @trip = Trip.find(params[:id])
    @photo=Photo.new()
    @photo.trip_id=params[:id]
  end

  # POST /trips
  # POST /trips.json
  def create
    @trip = Trip.new(params[:trip])

    respond_to do |format|
      if @trip.save
        format.html { redirect_to trips_url, notice: 'Viaje creado exitosamente' }
        format.json { render json: @trip, status: :created, location: @trip }
      else
        format.html { render action: "new" }
        format.json { render json: @trip.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /trips/1
  # PUT /trips/1.json
  def update
    @trip = Trip.find(params[:id])

    respond_to do |format|
      if @trip.update_attributes(params[:trip])
        format.html { redirect_to @trip, notice: 'Trip was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @trip.errors, status: :unprocessable_entity }
      end
    end
  end


  def cambiar_privacidad

    @trip=Trip.find(params[:id])
    @trip.private=!@trip.private
    @trip.save
    redirect_to edit_trip_path(@trip)
  end

  # DELETE /trips/1
  # DELETE /trips/1.json
  def destroy
    @trip = Trip.find(params[:id])
    @trip.destroy

    respond_to do |format|
      format.html { redirect_to trips_url }
      format.json { head :no_content }
    end
  end
end
