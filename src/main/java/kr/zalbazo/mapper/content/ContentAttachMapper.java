package kr.zalbazo.mapper.content;

import java.util.List;

import kr.zalbazo.model.pic.AttachFileDTO;

public interface ContentAttachMapper {
	
	public void insert(AttachFileDTO attach);
	public void deletePicCon(Long contentId);
	public void deletePic(String uuid);
	public List<AttachFileDTO> findByNo(Long contentId);
	public List<AttachFileDTO> getOldFiles();

}
