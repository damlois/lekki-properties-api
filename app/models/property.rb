class Property < ApplicationRecord
    validates :address, length: { minimum: 2 }, presence: { message: "address is required" }
    validates :propertyType, length: { minimum: 2 }, presence: { message: "propertyType is required" }
    validates :numberOfBedrooms, numericality: true, allow_nil: true
    validates :numberOfSittingRooms, numericality: true, allow_nil: true
    validates :numberOfKitchens, numericality: true, allow_nil: true
    validates :numberOfBathRooms, numericality: true, allow_nil: true
    validates :numberOfToilets, numericality: true, allow_nil: true
    validates :owner, length: { minimum: 2 }, presence: { message: "owner is required" }
    validates :description, length: { minimum: 2 }, allow_nil: true
    validates :validFrom, length: { minimum: 2 }, presence: { message: "validFrom is required" }
    validates :validTo, length: { minimum: 2 }, allow_nil: true

    before_save :downcase_fields

    def downcase_fields
        self.propertyType.downcase!
    end
end
