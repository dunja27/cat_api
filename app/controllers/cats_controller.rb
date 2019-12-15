class CatsController < ApplicationController
  def index
    # GET /cats
    self.render json: Cat.all
  end

  def show
    # GET /cats/123
    self.render json: Cat.find(self.params[:id])
  end

  def create
    # POST /cats
    cat = Cat.new(name: params[:cat][:name])

    if cat.save
      render json: cat
    else
      render json: cat.errors.full_messages, status: :unprocessable_entity
    end
  end

  def update
    cat = Cat.find(params[:id])
    if cat.update_attribute(:name, params[:cat][:name])
      render json: cat
    else
      render json: cat.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    Cat.find(params[:id]).destroy
  end
end
