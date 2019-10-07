package kr.zalbazo.model.hospital;

import java.util.List;

import kr.zalbazo.model.pic.AttachFileDTO;
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
public class Hospital {
	
	private Long hospitalId;
	private String name;
	private String address;
	private String treatStart;
	private String treatEnd;
	private String tel;
	private String info;
	private List<Label> label;
	private String userEmail;
	
    private List<AttachFileDTO> attachList;

    private String password;
    private String role;
}
