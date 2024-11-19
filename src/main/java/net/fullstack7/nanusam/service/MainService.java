package net.fullstack7.nanusam.service;

import java.util.List;
import net.fullstack7.nanusam.dto.GoodsDTO;

public interface MainService {
  // main페이지 상품 리스트
  List<GoodsDTO> mainViewGoodsList(int page);
}
