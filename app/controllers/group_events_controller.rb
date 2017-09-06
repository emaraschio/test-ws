class GroupEventsController < ApplicationController
  before_action :set_group_event, only: [:show, :update, :destroy]

  # GET /group_events
  def index
    @group_events = GroupEvent.all
    json_response(@group_events)
  end

  # POST /group_events
  def create
    @group_event = GroupEvent.create!(group_event_params)
    json_response(@group_event, :created)
  end

  # GET /group_events/:id
  def show
    json_response(@group_event)
  end

  # PUT /group_events/:id
  def update
    @group_event.update(group_event_params)
    head :no_content
  end

  # DELETE /group_events/:id
  def destroy
    @group_event.destroy
    head :no_content
  end

  private

  def group_event_params
    params.permit(:name, :description, :location, :user_id,
                  :published, :start_date, :end_date)
  end

  def set_group_event
    @group_event = GroupEvent.find(params[:id])
  end
end