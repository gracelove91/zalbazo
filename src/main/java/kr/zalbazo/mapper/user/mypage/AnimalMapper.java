package kr.zalbazo.mapper.user.mypage;

import java.util.List;

import kr.zalbazo.model.animal.Animal;

public interface AnimalMapper {


    void insert(Animal animal);

    Animal read(Long animalId);

    List<Animal> getList();

    int delete(Long animalId);

    int update(Animal animal);    

}

