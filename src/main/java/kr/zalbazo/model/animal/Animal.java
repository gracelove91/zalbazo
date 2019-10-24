package kr.zalbazo.model.animal;

import java.util.Date;

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

public class Animal {
	
	private Long animalId;
	private String type;
	private String sex;
	private Integer weight;
	private Integer age;
	private String aname;
	private String note;
	private Date lasttreatDate;
	private Date createdDate;
	private Date updatedDate;
	private String userEmail;
	
}
