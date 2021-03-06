class EventsController < ApplicationController
  # GET /events
  # GET /events.json
  def index
    @events = Event.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @events }
    end
  end

  # GET /events
  # GET /events.json
  def search

  end

  # GET events/search_date/trip_city_id
  def search_date
    @trip_city=TripCity.find(params[:trip_city_id])
    redirect_to :action => 'search_results', :trip_city_id=>params[:trip_city_id], :city=>@trip_city.city_name
  end

  def search_advanced
    @trip_city=TripCity.find(params[:trip_city_id])
    eventful = Eventful::API.new 'nfMz5xQp7J756Bp7'
    @categories=[]
    @categories = eventful.call 'categories/list'
    @categories=@categories['category']
    @categories=@categories.map{|categ| [(categ['name'].html_safe),categ['id']]}
    @categories.push(%w(Cualquiera ))

    respond_to do |format|
      format.html
    end
  end

  def search_results
    @results=[]
    # get categories:
    @categories=[]
    eventful = Eventful::API.new 'nfMz5xQp7J756Bp7'
    @categories = eventful.call 'categories/list'
    @categories=@categories['category']
    @categories=@categories.map{|categ| [(categ['name'].html_safe),categ['id']]}
    @categories.push(["Cualqueria",""])

    dateParam=nil
    category=nil
    @event=nil
    unless params[:date_range].nil?
      dateParam=params[:date_range]
    end
    unless params[:category]==""
      category=params[:category]
    end

    unless params[:trip_city_id].nil?
      @trip_city=TripCity.find(params[:trip_city_id])
      if dateParam.nil?
        dateParam=@trip_city.start_date.strftime("%Y%m%d")+"00-"+@trip_city.end_date.strftime("%Y%m%d")+"00"
      end
    end

    eventful = Eventful::API.new 'nfMz5xQp7J756Bp7'
    @results1 = eventful.call 'events/search',
                            :keywords => params[:words],
                            :category=>params[:category],
                            :location => params[:city],#podría especificar latitud, longitud y radio de búsqueda
                            :page_size => 5,
                            :date => dateParam
      @results=[]
      unless @results1['events'].nil?
        @results=@results1['events']['event']
      end

    respond_to do |format|
      format.html
      format.json { render json: @results }
    end
  end

  # GET /events/1
  # GET /events/1.json
  def show
    @event = Event.find(params[:id])
    @trip_city=TripCity.find(@event.trip_city_id)
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @event }
    end
  end

  # GET /events/new
  # GET /events/new.json
  def new

   @trip_city=TripCity.find(params[:trip_city_id])

    @event = Event.new
   @event.trip_city=@trip_city

   @event.trip_city_id=params[:trip_city_id]

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @event }
    end
  end

  # GET /events/1/edit
  def edit
    @event = Event.find(params[:id])
  end

  # POST /events
  # POST /events.json
  def create

    @event = Event.new(params[:event])
    @event.save
    @trip_city = TripCity.find(@event.trip_city_id)
    @place=Place.new
    @place.city=@trip_city.city_name
    @place.event_id=@event.id
    @place.save

    redirect_to trip_city_path(@trip_city)

  end

  def add_eventful_event
    @trip_city=TripCity.find(params['trip_city_id'])
    @event = Event.new
    @event.save
    @event.trip_city_id=params['trip_city_id']
    @event.name=params['name']
    @event.begin_date=params['begin_date']
    @event.end_date=params['end_date']
    @event.description=params['description']
    @event.url=params['url']
    @event.picture_link=params['picture_link']
    @event.EventfulId=params['eventful_id']
    @event.save
    @place=Place.new
    @place.city=@trip_city.city_name
    @place.event_id=@event.id
    @place.latitude=params['latitude']
    @place.longitude=params['longitude']
    @place.save
    redirect_to trip_city_path(@trip_city)
  end

  # PUT /events/1
  # PUT /events/1.json
  def update
    @event = Event.find(params[:id])

    respond_to do |format|
      if @event.update_attributes(params[:event])
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event = Event.find(params[:id])
    @event.destroy

    respond_to do |format|
      format.html { redirect_to events_url }
      format.json { head :no_content }
    end
  end
end
