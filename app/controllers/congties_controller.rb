# encoding: UTF-8
class CongtiesController < ApplicationController
  load_and_authorize_resource
  skip_authorize_resource  :only => [:index, :show]

=begin

  before_filter :authenticate_user!

  before_filter :kiemtra_admin

  def kiemtra_admin
    if current_user.email != 'admin@buytcantho.com' then
      redirect_to root_path
    end
  end
=end

  # GET /congties
  # GET /congties.json
  def index
    @congties = Congty.paginate(:page => params[:page]).order('tenct ASC')

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @congties }
    end
  end

  # GET /congties/1
  # GET /congties/1.json
  def show
    @congty = Congty.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @congty }
    end
  end

  # GET /congties/new
  # GET /congties/new.json
  def new
    @congty = Congty.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @congty }
    end
  end

  # GET /congties/1/edit
  def edit
    @congty = Congty.find(params[:id])
  end

  # POST /congties
  # POST /congties.json
  def create
    @congty = Congty.new(params[:congty])

    respond_to do |format|
      if @congty.save
        format.html { redirect_to @congty, notice: 'Thêm công ty thành công.' }
        format.json { render json: @congty, status: :created, location: @congty }
      else
        format.html { render action: "new" }
        format.json { render json: @congty.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /congties/1
  # PUT /congties/1.json
  def update
    @congty = Congty.find(params[:id])

    respond_to do |format|
      if @congty.update_attributes(params[:congty])
        format.html { redirect_to @congty, notice: 'Cập nhật công ty thành công.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @congty.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /congties/1
  # DELETE /congties/1.json
  def destroy
    @congty = Congty.find(params[:id])
    @congty.destroy

    respond_to do |format|
      format.html { redirect_to congties_url }
      format.json { head :no_content }
    end
  end
end
