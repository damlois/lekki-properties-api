class Api::V1::PropertiesController < ApplicationController 
    def index
      where = {}

      if params[:owner]
          where["owner"] = params[:owner]
      end
      
      if params[:propertyType]
          where["propertyType"] = params[:propertyType].downcase
      end

      if params[:numberOfBedrooms]
        where["numberOfBedrooms"] = params[:numberOfBedrooms]
      end

      if params[:numberOfSittingRooms]
        where["numberOfSittingRooms"] = params[:numberOfSittingRooms]
      end

      if params[:numberOfKitchens]
        where["numberOfKitchens"] = params[:numberOfKitchens]
      end

      if
        params[:numberOfToilets]
        where["numberOfToilets"] = params[:numberOfToilets]
      end

      if params[:numberOfBathRooms]
        where["numberOfBathRooms"] = params[:numberOfBathRooms]
      end
      
      if(params)
        properties = Property.where(where)
      else
        properties = Property.all
      end
      
      if properties
        render json: {status: "SUCCESS", message: "Fetched properties successfully", data: properties}, status: :ok
      else
        render json: properties.errors, status: :bad_request
      end
    end

    def create
      property = Property.new(property_params)
    
      if property.save
        render json: {status: "SUCCESS", message: "Property was created successfully!", data: property}, status: :created
      else
        render json: property.errors, status: :unprocessable_entity
      end
    end

    def show
      property = Property.find(params[:id])

      if property
        render json: {data: property}, state: :ok
      else
        render json: {message: "Property does not exist"}, status: :bad_request
      end
    end

    def destroy
      property = Property.find(params[:id])

      if property.destroy!
        render json: {message: "Property was deleted successfully"}, status: :ok
      else
        render json: {message: "Property does not exist"}, status: :bad_request
      end
    end

    def update
      property = Property.find(params[:id])

      if(!property)
        render json: {message: "Property does not exist"}, status: :bad_request
      end

      if property.update!(property_update_params)
        render json: {message: "Property was updated successfully", data: property}, status: :ok
      else
        render json: {message: "Property cannot be updated"}, status: :unprocessable_entity
      end
    end

    private
    def property_params
      params.require(:property).permit(:address, :propertyType, :numberOfBedrooms, :numberOfSittingRooms, :numberOfKitchens, :numberOfBathRooms,
        :numberOfToilets, :owner, :description, :validFrom, :validTo)
    end

    def property_update_params
      params.require(:property).permit(:numberOfBedrooms, :numberOfSittingRooms, :numberOfKitchens, :numberOfBathRooms,
        :numberOfToilets, :description, :validTo)
    end
end