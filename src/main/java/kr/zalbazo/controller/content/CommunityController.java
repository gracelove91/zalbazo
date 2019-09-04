package kr.zalbazo.controller.content;

import lombok.extern.log4j.Log4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@Log4j
@RequestMapping({"/community/*"})
public class CommunityController {

    private static final Long COMMUNITY_CATEGORY_NUM = 1L;

}
