require 'swagger_helper'

describe 'Lekki Properties API' do

  #Create a property
  path '/api/v1/properties' do

    post 'Create a property' do
      tags 'Property'
      consumes 'application/json', 'application/xml'
      parameter name: :property, in: :body, schema: {
        type: :object,
        properties: {
          address: { type: :string },
          propertyType: { type: :string },
          numberOfBedrooms: { type: :integer },
          numberOfSittingRooms: { type: :integer },
          numberOfKitchens: { type: :integer },
          numberOfBathRooms: { type: :integer },
          numberOfToilets: { type: :integer },
          owner: { type: :string },
          description: { type: :string },
          validFrom: { type: :string },
          validTo: { type: :string }
        },
        required: [ 'address', 'propertyType', 'owner', 'validFrom' ]
      }

      response '201', 'property created successfully' do
        let(:property) { { address: 'Ashi Elero Ibadan', propertyType: 'Duplex', owner: 'John Doe', validFrom: '23-06-1023' } }
        run_test!
      end

      response '422', 'invalid request' do
        let(:property) { { address: 'f' } }
        run_test!
      end
    end
  end

  #Get all properties
  path '/api/v1/properties' do

    get 'Get properties' do
      tags 'Property'
      description 'get all properties or filter by owner, propertyType, numberOfBedrooms, numberOfSittingRooms, numberOfKitchens, numberOfBathrooms or numberOfToilets'
      produces 'application/json', 'application/xml'
      parameter name: :owner, :in => :query, :type => :string
      parameter name: :propertyType, :in => :query, :type => :string
      parameter name: :numberOfBedrooms, :in => :query, :type => :string
      parameter name: :numberOfSittingRooms, :in => :query, :type => :string
      parameter name: :numberOfKitchens, :in => :query, :type => :string
      parameter name: :numberOfBathRooms, :in => :query, :type => :string
      parameter name: :numberOfToilets, :in => :query, :type => :string

      response '200', 'properties fetched successfully' do
        schema type: :object,
          properties: {
            id: { type: :integer },
            address: { type: :string },
            propertyType: { type: :string },
            numberOfBedrooms: { type: :integer },
            numberOfSittingRooms: { type: :integer },
            numberOfKitchens: { type: :integer },
            numberOfBathRooms: { type: :integer },
            numberOfToilets: { type: :integer },
            owner: { type: :string },
            description: { type: :string },
            validFrom: { type: :string },
            validTo: { type: :string }
          },
          required: [ 'address', 'propertyType', 'owner', 'validFrom' ]

        let(:id) { Property.create(address: 'Ashi Elero Ibadan', propertyType: 'Duplex', owner: 'John Doe', validFrom: '23-06-1023').id }
        run_test!
      end

      response '400', 'bad request' do
        let(:id) { 'invalid' }
        run_test!
      end
    end
  end

  #Get one by id
  path '/api/v1/properties/{id}' do

    get 'Get a property by Id' do
      tags 'Property'
      produces 'application/json', 'application/xml'
      parameter name: :id, :in => :path, :type => :string

      response '200', 'property fetched successfully' do
        schema type: :object,
          properties: {
            id: { type: :integer },
            address: { type: :string },
            propertyType: { type: :string },
            numberOfBedrooms: { type: :integer },
            numberOfSittingRooms: { type: :integer },
            numberOfKitchens: { type: :integer },
            numberOfBathRooms: { type: :integer },
            numberOfToilets: { type: :integer },
            owner: { type: :string },
            description: { type: :string },
            validFrom: { type: :string },
            validTo: { type: :string }
          },
          required: [ 'address', 'propertyType', 'owner', 'validFrom' ]

        let(:id) { Property.create(address: 'Ashi Elero Ibadan', propertyType: 'Duplex', owner: 'John Doe', validFrom: '23-06-1023').id }
        run_test!
      end

      response '404', 'property not found' do
        let(:id) { 'invalid' }
        run_test!
      end
    end
  end

  #Update a property
  path '/api/v1/properties/{id}' do

    put 'Update a property' do
      tags 'Property'
      consumes 'application/json', 'application/xml'
      parameter name: :property, in: :body, schema: {
        type: :object,
        properties: {
          numberOfBedrooms: { type: :integer },
          numberOfSittingRooms: { type: :integer },
          numberOfKitchens: { type: :integer },
          numberOfBathRooms: { type: :integer },
          numberOfToilets: { type: :integer },
          description: { type: :string },
          validTo: { type: :string }
        }
      }

      response '200', 'property updated successfully' do
        let(:property) { { address: 'Ashi Elero Ibadan', propertyType: 'Duplex', owner: 'John Doe', validFrom: '23-06-1023' } }
        run_test!
      end

      response '404', 'Property does not exist' do
        let(:property) { { address: 'f' } }
        run_test!
      end

      response '422', 'invalid request' do
        let(:property) { { address: 'f' } }
        run_test!
      end
    end
  end

  #Delete a property
  path '/api/v1/properties/{id}' do

    delete 'Delete a property' do
      tags 'Property'
      consumes 'application/json', 'application/xml'

      response '200', 'property deleted successfully' do
        let(:property) { { address: 'Ashi Elero Ibadan', propertyType: 'Duplex', owner: 'John Doe', validFrom: '23-06-1023' } }
        run_test!
      end

      response '404', 'Property does not exist' do
        let(:property) { { address: 'f' } }
        run_test!
      end

      response '422', 'invalid request' do
        let(:property) { { address: 'f' } }
        run_test!
      end
    end
  end
end