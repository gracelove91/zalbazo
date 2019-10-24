package kr.zalbazo.model.hospital;

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
public class Label {

	private Long hospitalId;
	private int labelCode;
	private String name;

}