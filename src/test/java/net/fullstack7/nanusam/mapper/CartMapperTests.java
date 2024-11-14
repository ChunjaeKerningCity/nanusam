package net.fullstack7.nanusam.mapper;

import lombok.extern.log4j.Log4j2;
import net.fullstack7.nanusam.domain.CartVO;
import net.fullstack7.nanusam.dto.PageRequestDTO;
import net.fullstack7.nanusam.mapper.CartMapper;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;

import java.util.List;

@Log4j2
@ExtendWith(SpringExtension.class)
@ContextConfiguration(locations = "file:src/main/webapp/WEB-INF/config/root-context.xml")
public class CartMapperTests {
    @Autowired(required = false)
    private CartMapper cartMapper;


    @Test
    public void testAdd(){
        CartVO cartVO = CartVO.builder()
                .memberId("테스트유저11")
                .goodsIdx(1)
                .build();

        cartMapper.add(cartVO);
    }

    @Test
    public void testList(){
        String memberId = "테스트유저1";
        List<CartVO> cartVOList = cartMapper.list(memberId);
        Assertions.assertNotNull(cartVOList);
        log.info(cartVOList);
    }

//    @Test
//    public void testDelete(){
//        CartVO cartVO = CartVO.builder()
//                .memberId("테스트유저3")
//                .goodsIdx(3)
//                .build();
//
//        cartMapper.add(cartVO);
//
//        Integer addIdx = cartVO.getIdx();
//        log.info("추가된데이터idx:"+addIdx);
//
//        Assertions.assertNotNull(addIdx, "자동으로 생성된 idx 값이 null입니다.");
//        Assertions.assertTrue(addIdx > 0, "자동 생성된 idx 값이 0입니다.");
//
//        cartMapper.delete(addIdx);
//
//        List<CartVO> cartVOList = cartMapper.list();
//
//        boolean isDeleted = cartVOList.stream()
//                .noneMatch(cart -> cart.getMemberId().equals(cartVO.getMemberId()) &&
//                        cart.getGoodsIdx() == cartVO.getGoodsIdx());
//
//        Assertions.assertTrue(isDeleted, "삭제된 데이터가 존재함");
//
//        log.info("삭제후 목록:"+cartVOList);
//
//    }

    @Test
    public void testDelete() {
        // 새로 추가할 데이터 설정
        CartVO cartVO = CartVO.builder()
                .memberId("테스트유저3")
                .goodsIdx(3)
                .build();

        // 데이터 추가
        cartMapper.add(cartVO);

        // 추가된 데이터의 idx 값을 가져옵니다. (자동으로 채워짐)
        Integer addIdx = cartVO.getIdx();
        System.out.println("추가된 데이터 idx: " + addIdx); // 로그로 확인

        // idx가 제대로 채워졌는지 확인
        Assertions.assertNotNull(addIdx, "자동으로 생성된 idx 값이 null입니다.");
        Assertions.assertTrue(addIdx > 0, "자동 생성된 idx 값이 0입니다.");

        // 데이터를 삭제합니다.
        int rowsDeleted = cartMapper.delete(addIdx);  // 삭제할 데이터의 idx 값을 사용
        System.out.println("삭제된 행 수: " + rowsDeleted); // 삭제된 행 수 로그 출력

        // 삭제된 데이터가 실제로 있는지 확인 (영향을 받은 행 수 체크)
        Assertions.assertTrue(rowsDeleted > 0, "삭제된 데이터가 없습니다.");

        // 데이터 목록을 가져옵니다.
        List<CartVO> cartVOList = cartMapper.list(cartVO.getMemberId());

        // 삭제 후 DB에서 제대로 삭제되었는지 확인
        System.out.println("삭제 후 목록: " + cartVOList); // 삭제 후 목록 출력

        // 삭제된 데이터가 목록에 없으면 성공
        boolean isDeleted = cartVOList.stream()
                .noneMatch(cart -> cart.getMemberId().equals(cartVO.getMemberId()) &&
                        cart.getGoodsIdx() == cartVO.getGoodsIdx());

        // 삭제된 데이터가 목록에 없으면 성공
        Assertions.assertTrue(isDeleted, "삭제된 데이터가 존재함");

        log.info("삭제후 목록: " + cartVOList);
    }


}