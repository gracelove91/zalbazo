package kr.zalbazo.model.user;

import java.util.List;

import javax.persistence.Column;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;

import org.hibernate.annotations.Entity;

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
@Entity
public class HospitalInfo {
	
	private Long hospitalId;
	@Column
	@NotNull
	@Pattern(regexp = "\\S{5,20}", message = "이름은 5자 이상 입력해주세요")
	private String name;
	@Column
	@NotNull
	private String address;
	@Column
	@NotNull
	private String treatStart;
	@Column
	@NotNull
	private String treatEnd;
	@Column
	@NotNull
	private String tel;
	@Column
	@NotNull
	private String info;
	
	private List<Integer> label;
	
    private String userEmail;
    
    private List<AttachFileDTO> attachList;

    private String password;
    private String role;
	

}
