class MembersController < ApplicationController
  before_action :set_member, only: [:update, :destroy]

  # POST /login
  def login
    @member = Member.find_by(email:params[:login_id], password:params[:password])
    if @member.nil?
      render json: {'result': false, 'message': 'メールアドレスまたはパスワードが間違っていますよ'}
    else
      render json: {'result': true, 'member':{'member_id': @member.member_id, 'token': 'ACCESSTOKEN'}, 'member_id': @member.member_id}
    end
  end

  # GET /members
  def index
    @members = Member.all

    render json: @members
  end

  # GET /members/1
  def show
    if params[:token].eql?('ACCESSTOKEN')
      @member = Member.find_by(member_id:params[:member_id])
      if @member.nil?
        render json: {'result': false, 'logout': true}
      else
        render json: {'result': true, 'point':{'code':{'value': @member.member_id, 'type': 'nw-7'}, 'name': @member.name, 'point_num': @member.point}}
      end
    else
      render json: {'result': false, 'logout': true}
    end
  end

  # POST /members
  def create
    @member = Member.new(member_params)

    if @member.save
      render json: @member, status: :created, location: @member
    else
      render json: @member.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /members/1
  def update
    if @member.update(member_params)
      render json: @member
    else
      render json: @member.errors, status: :unprocessable_entity
    end
  end

  # DELETE /members/1
  def destroy
    @member.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_member
      @member = Member.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def member_params
      params.require(:member).permit(:member_id, :password, :name, :email, :sex, :point, :rank)
    end
end
