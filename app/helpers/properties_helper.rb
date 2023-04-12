module PropertiesHelper
    # Individual property doesn't have img then this helper to set a default image
    def property_thumbnail property
        img = property.photo.present? ? property.photo.thumb.url : "house.jpeg"
        image_tag img, class: "property-thumb"
    end

    def property_photo_url property
        img = property.photo.present? ? property.photo.url : "house.jpeg"
        image_tag img, class: "property-photo"
    end
end
