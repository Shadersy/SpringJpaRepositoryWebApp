package ru.gvozdilin.jpaTestWebApp.Service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ru.gvozdilin.jpaTestWebApp.Entity.House;
import ru.gvozdilin.jpaTestWebApp.Repository.CustomizedHousesCrudRepository;

import java.util.List;
import java.util.Optional;

@Service
public class HouseDataService {

    @Autowired
    private CustomizedHousesCrudRepository crudRepository;


    public void testHouseCrudRepository(){
        Optional<House> houseOptional = crudRepository.findById(1L);
    }


    
}
