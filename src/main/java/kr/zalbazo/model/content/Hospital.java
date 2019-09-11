package kr.zalbazo.model.content;


import lombok.*;

import java.util.Date;
import java.util.List;

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
	private String  treatStart;
	private String  treatEnd;
	private String address;
	private String tel;
	private String  info;
	private Long categoryId;
	private List<Label> label;
}
