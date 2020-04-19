package ru.gvozdilin.jpaTestWebApp.Repository;


import org.springframework.data.jpa.repository.Query;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import ru.gvozdilin.jpaTestWebApp.Entity.House;

import java.util.List;


@Repository
public interface CustomizedHousesCrudRepository extends CrudRepository<House, Long> {

    List<House> findAllByAddress(String address);

    @Override
    Iterable<House> findAll();

 @Query(nativeQuery = true, value = "SELECT id, address, MAX(indication) as indication from house")
    List<House> getMaxIndication();

    @Override
    <S extends House> S save(S s);

//    List<House> findFirstOrderByIndicationAsc();

    @Override
    void deleteById(Long aLong);



}
