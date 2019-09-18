package kr.zalbazo.model.favorite_hospital;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@ToString
@AllArgsConstructor
@Getter
@Setter

public class FavoriteHospital {

	
	private String userEmail;
	private Long hospitalId;

}
