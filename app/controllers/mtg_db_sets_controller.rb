require 'mtgdb_api'

class MtgDbSetsController < ApplicationController
  before_action :set_expansion, only: [:show]

  def index
    respond_to do |format|
      format.html {
        @expansions = MtgDbSetDecorator.decorate_collection(
          MtgDbSet.all.paginate(page: params[:page])
        )
      }
    end
  end

  def show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_expansion
      @expansion = MtgDbSet.find(params[:id])
    end
end
