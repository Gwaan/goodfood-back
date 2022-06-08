package fr.cesi.goodfood.mapper;

import fr.cesi.goodfood.dto.RestaurantDto;
import fr.cesi.goodfood.entity.Restaurant;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.mapstruct.factory.Mappers;

@Mapper
public interface RestaurantMapper {

    RestaurantMapper INSTANCE = Mappers.getMapper(RestaurantMapper.class);

    @Mapping(source="name", target = "name")
    @Mapping(source="email", target = "email")
    @Mapping(source="street", target = "street")
    @Mapping(source="city", target = "city")
    @Mapping(source="zipCode", target = "zipCode")
    @Mapping(source="region", target = "region")
    @Mapping(source="country", target = "country")
    RestaurantDto map(Restaurant restaurant);

}
