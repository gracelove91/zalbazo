package kr.zalbazo.model.content;

import lombok.*;

import java.util.Date;

@NoArgsConstructor
@ToString
@AllArgsConstructor
@Getter
@Setter
public class Label {

	private Long hospitalId;
	private int labelCode;
	
}
