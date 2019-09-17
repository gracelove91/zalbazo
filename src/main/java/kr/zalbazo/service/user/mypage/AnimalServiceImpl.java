package kr.zalbazo.service.user.mypage;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.zalbazo.mapper.user.mypage.AnimalMapper;
import kr.zalbazo.model.animal.Animal;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class AnimalServiceImpl implements AnimalService {

    @Autowired
    private AnimalMapper mapper;

    @Override
    public void register(Animal animal) {
        mapper.insert(animal);
    }

    @Override
    public Animal get(Long animalId) {
        return mapper.read(animalId);
    }

    @Override
    public boolean modify(Animal animal) {
        return mapper.update(animal) == 1;
    }

    @Override
    public boolean remove(Long animalId) {
        return mapper.delete(animalId) == 1;
    }

//    @Override
//    public List<Content> getList(Long categoryId) {
//        return mapper.getList(categoryId);
//    }
    
    @Override
    public List<Animal> getList(){
    
    	return mapper.getList();
    }

   
}
