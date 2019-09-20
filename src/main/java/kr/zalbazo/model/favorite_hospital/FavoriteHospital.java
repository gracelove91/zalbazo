package kr.zalbazo.model.favorite_hospital;

import java.util.List;

import kr.zalbazo.model.hospital.HospitalLabel;
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
	private String name;
	private String address;
	private String treatStart;
	private String treatEnd;
	private String tel;
	private List<HospitalLabel> label;
}

