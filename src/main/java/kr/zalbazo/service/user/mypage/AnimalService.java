package kr.zalbazo.service.user.mypage;

import java.util.List;

import kr.zalbazo.model.animal.Animal;


public interface AnimalService {
	
    void register(Animal animal);
    Animal get(Long animalId);
    boolean modify(Animal animal);
    boolean remove(Long animalId);
    //List<Content> getList(Long categoryId);
    List<Animal> getList();
}
