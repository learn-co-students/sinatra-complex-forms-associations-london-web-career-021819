class PetsController < ApplicationController

  get '/pets' do
    @pets = Pet.all
    # binding.pry
    erb :'/pets/index' 
  end

  get '/pets/new' do
    @owners = Owner.all
    # binding.pry
    erb :'/pets/new'
  end

  post '/pets' do 
    @pet = Pet.create(params['pet'])
    # binding.pry
    if !params["owner_name"]["name"].empty?
      # binding.pry
      @owner = Owner.create(name: params["owner_name"]["name"])
      # binding.pry
      @owner.pets << @pet
      # binding.pry
    end
    # binding.pry
    redirect to "pets/#{@pet.id}"
  end

  get '/pets/:id' do 
    @pet = Pet.find(params[:id])
    erb :'/pets/show'
  end

  get '/pets/:id/edit' do
    @pet = Pet.find(params[:id])
    @owners = Owner.all
    erb :'/pets/edit'
  end

  patch '/pets/:id' do
    @pet = Pet.find(params[:id])
    # binding.pry
    @pet.update(params['pet'])
    # binding.pry
    if !params['owner']['name'].empty?
      # binding.pry
      @owner = Owner.create(name: params['owner']['name'])
      # binding.pry
      @owner.pets << @pet
      # binding.pry
    end
    # binding.pry
    # "asd"
    redirect to "pets/#{@pet.id}"
  end
end