class CatsController < ApplicationController

    def index
        @cats = Cat.all
        render :index
    end

    def create
        @cat = Cat.new(cat_params)
        if @cat.save
            render :show
        else
            render json: @cat.errors.full_messages, status: 422
        end

    end

    def show
        @cat = Cat.find_by(id: params[:id])
        render :show
    end

    def edit
    end

    def new
    end

    def update
    end

    private

    def cat_params
        params.require(:cat).permit(:birth_date, :name, :sex, :color, :description)
    end
end
