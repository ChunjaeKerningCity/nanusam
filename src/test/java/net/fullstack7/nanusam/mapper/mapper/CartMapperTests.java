package net.fullstack7.nanusam.mapper.mapper;

import lombok.extern.log4j.Log4j2;
import net.fullstack7.nanusam.domain.CartVO;
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
                .memberId("테스트유저1")
                .goodsIdx(1)
                .build();

        cartMapper.add(cartVO);
    }

    @Test
    public void testList(){
        List<CartVO> cartVOList = cartMapper.list();
        Assertions.assertNotNull(cartVOList);
        log.info(cartVOList);
    }

    @Test
    public void testDelete(){
        CartVO cartVO = CartVO.builder()
                .memberId("테스트유저3")
                .goodsIdx(3)
                .build();

        cartMapper.add(cartVO);

        cartMapper.delete(3);

        List<CartVO> cartVOList = cartMapper.list();

        boolean isDeleted = cartVOList.stream()
                .noneMatch(cart -> cart.getMemberId().equals(cartVO.getMemberId()) &&
                        cart.getGoodsIdx() == cartVO.getGoodsIdx());

        Assertions.assertTrue(isDeleted, "삭제된 데이터가 존재함");

        log.info("삭제후 목록:"+cartVOList);

    }


}