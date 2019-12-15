class ToysController < ApplicationController
  def index
    # /cats/:cat_id/toys
    cat = Cat.find(params[:cat_id])
    render json: cat.toys
  end

  def show
    # /cats/:cat_id/toys/:id << redundant
    # /toys/:id << prefer this
    render json: Toy.find(params[:id])
  end

  def create
    # POST /cats/:cat_id/toys
    # POST /toys

    toy = Toy.new(params[:toy].permit(:cat, :name, :ttype))
    toy.cat_id = params[:cat_id]
    if toy.save
      render json: toy
    else 
      render json: toy.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    # /toys/:id
    toy = Toy.find(params[:id])
    toy.destroy
    render json: toy
  end

  def update
    # /toys/:id
    toy = Toy.find(params[:id])
    success = toy.update(toy_params)
    if success
      render json: toy
    else
      render json: toy.errors.full_messages, status: :unprocessable_entity
    end
  end

  private

  def toy_params
    params[:toy].permit(:name, :ttype)
  end
end
