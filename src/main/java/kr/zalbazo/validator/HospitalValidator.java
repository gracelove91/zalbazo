package kr.zalbazo.validator;

import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import kr.zalbazo.model.user.HospitalInfo;

public class HospitalValidator implements Validator {

	@Override
	public boolean supports(Class<?> clazz) {
		return HospitalInfo.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		HospitalInfo hospital = (HospitalInfo)target;
		
		if(hospital.getName().trim() == null || hospital.getName().trim() == "" ) {
			errors.rejectValue("name", "이름을 입력하세요");
		}
		
		
	}
	
}
