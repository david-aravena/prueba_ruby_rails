class Property < ApplicationRecord
    belongs_to :user

    def self.userProperties(userId)
        self.where(user_id: userId)
    end

    def self.searchToiletsNumber(number, userId)
        self.where(toilets: number, user_id: userId)
    end

    def self.searchRoomsNumber(number, userId)
        self.where(rooms: number, user_id: userId)
    end

    def self.searchAddress(address, userId)
        self.where("address LIKE ? AND user_id = #{userId}", "%#{address}%")
    end

    def self.createProperty(strong_params, user_id)
        property = self.new(strong_params)
        property.user_id = user_id
        return property
    end
end
