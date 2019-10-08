package kr.zalbazo.service.user;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.zalbazo.mapper.user.ReserveMapper;
import kr.zalbazo.model.user.Reserve;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class ReserveServiceImpl implements ReserveService{
	
	@Autowired 
	ReserveMapper reservemapper;
	
	
	
	@Override
	public void register(Reserve reserve) {
		// TODO Auto-generated method stub
		
		reservemapper.insert(reserve);
		
	}

	@Override
	public Reserve get(String email) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean remove(Long reserveId) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public List<Reserve> getList() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<String> getTime(String date) {
		// TODO Auto-generated method stub
		
		return reservemapper.readTime(date);
	}

  
}