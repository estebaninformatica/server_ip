

class ServersController < ApplicationController
  #before_action :set_server
  protect_from_forgery :except => :create_update

  # GET /servers
  # GET /servers.json
  def index
    @servers = Server.all
  end

  # GET /servers/1
  # GET /servers/1.json
  def show
    render json: Server.where(name: params[:name]).first
  end

  # GET /servers/new
  def create_update
    @server = Server.find_or_create_by(name: params[:name])
    @server.ip = request.remote_ip
    @server.save
    render json: @server
  end

  def destroy
    @server = Server.find(params[:id])
    @server.destroy
    respond_to do |format|
      format.html { redirect_to servers_url, notice: 'Server was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    # Never trust parameters from the scary internet, only allow the white list through.
    def server_params
      params.require(:server).permit(:name, :ip)
    end
end
