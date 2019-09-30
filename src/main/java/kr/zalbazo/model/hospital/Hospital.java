package kr.zalbazo.model.hospital;

import lombok.*;

import java.util.List;

import kr.zalbazo.model.pic.AttachFileDTO;

@NoArgsConstructor
@ToString
@AllArgsConstructor
@Getter
@Setter
public class Hospital {
	
	private Long hospitalId;
	private String name;
	private String address;
	private String treatStart;
	private String treatEnd;
	private String tel;
	private String info;
	private List<HospitalLabel> label;
}
