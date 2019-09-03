package kr.zalbazo.service;

import kr.zalbazo.mapper.content.ContentMapper;
import kr.zalbazo.model.content.Content;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public class ContentServiceImpl implements ContentService {

    @Autowired
    private ContentMapper mapper;

    @Override
    public void register(Content content) {
        mapper.insert(content);
    }

    @Override
    public Content get(Long id) {
        return mapper.read(id);
    }

    @Override
    public boolean modify(Content content) {
        return mapper.update(content) == 1;
    }

    @Override
    public boolean remove(Long id) {
        return mapper.delete(id) == 1;
    }

    @Override
    public List<Content> getList() {
        return mapper.getList();
    }
}
