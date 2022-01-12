class SpicesController < ApplicationController
    def index
        spices = Spice.all
        render json: spices, status: :ok
    end

    def create
            spice = Spice.create(spice_params)
            render json: spice, status: :created
    end

    def update
        spice = find_spice
        spice.update(spice_params)
        render json: spice
    end

    def destroy
        spice = find_spice
        spice.destroy
        render json: {}
    end

private
def spice_params
    params.permit(:title, :image, :description, :notes, :rating)
end
def find_spice
    Spice.find_by_id(params[:id])
end
end
