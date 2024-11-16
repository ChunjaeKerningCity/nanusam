package net.fullstack7.nanusam.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import net.fullstack7.nanusam.domain.GoodsVO;
import net.fullstack7.nanusam.domain.PaymentVO;
import net.fullstack7.nanusam.dto.GoodsDTO;
import net.fullstack7.nanusam.dto.PageRequestDTO;
import net.fullstack7.nanusam.dto.PageResponseDTO;
import net.fullstack7.nanusam.dto.PaymentDTO;
import net.fullstack7.nanusam.mapper.GoodsMapper;
import net.fullstack7.nanusam.mapper.PaymentMapper;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
@Log4j2
public class PaymentServiceImpl implements PaymentService {
    private final PaymentMapper paymentMapper;
    private final GoodsMapper goodsMapper;
    private final ModelMapper modelMapper;

    @Override
    public String regist(PaymentDTO dto) {

        GoodsVO item = goodsMapper.view(dto.getGoodsIdx());

        if(item == null || (item.getReservationId() != null && !item.getReservationId().equals(dto.getBuyer())) || item.getStatus().equals("N") || item.getStatus().equals("D")) {
            return "구매 불가 상품입니다.";
        }

        dto.setSeller(item.getMemberId());

        PaymentVO paymentVO = modelMapper.map(dto, PaymentVO.class);
        paymentMapper.regist(paymentVO);

        if(paymentVO.getIdx() < 1) {
            return "다시 시도해주세요.";
        }

        int result = goodsMapper.modifyStatus(GoodsVO.builder().idx(dto.getGoodsIdx()).status("N").reservationId(dto.getBuyer()).build());

        if(result < 1) {
            paymentMapper.deleteByIdx(paymentVO.getIdx());
            return "결제 실패";
        }

        dto.setGoodsInfo(modelMapper.map(item, GoodsDTO.class));

        return null;
    }

    @Override
    public PageResponseDTO<PaymentDTO> listWithGoodsByBuyer(PageRequestDTO pageRequestDTO) {
        List<PaymentDTO> paymentlist = paymentMapper.listWithGoodsByBuyer(pageRequestDTO);

//        paymentlist.stream().map(dto -> modelMapper.map(dto, PaymentDTO.class)).collect(Collectors.toList());
        PageResponseDTO<PaymentDTO> pageResponseDTO = PageResponseDTO.<PaymentDTO>withAll().
                dtoList(paymentlist)
                .reqDTO(pageRequestDTO)
                .total_count(paymentMapper.total_count(pageRequestDTO))
                .build();

        return pageResponseDTO;
    }

    @Override
    public PaymentDTO view(int idx) {
        return paymentMapper.viewWithGoods(idx);
    }

    @Override
    public String deliveryStart(int idx, String seller) {

        PaymentDTO dto = paymentMapper.viewWithGoods(idx);

        if(dto == null) {
            return "결제 정보가 없습니다.";
        }

        if(!dto.getSeller().equals(seller)) {
            return "상품 판매자만 접근 가능합니다.";
        }

        if(!dto.getDeliveryStatus().equals("0")) {
            return "이미 배송한 상품입니다.";
        }

        paymentMapper.modifyDeliveryStatus(PaymentVO.builder().idx(idx).seller(seller).deliveryStatus("1").build());

        return "배송 시작::"+dto.getBuyer()+"::"+dto.getGoodsInfo().getName();
    }

    @Override
    public String deliveryEnd(int idx, String buyer) {
        PaymentDTO dto = paymentMapper.viewWithGoods(idx);

        if(dto == null) {
            return "결제 정보가 없습니다.";
        }

        if(!dto.getBuyer().equals(buyer)) {
            return "상품 구매자만 접근 가능합니다.";
        }

        if(dto.getDeliveryStatus().equals("2")) {
            return "이미 배송 완료된 상품입니다.";
        }
        if(dto.getDeliveryStatus().equals("0")) {
            return "아직 배송되지 않은 상품입니다.";
        }

        paymentMapper.modifyDeliveryStatus(PaymentVO.builder().idx(idx).buyer(buyer).deliveryStatus("2").build());

        return "배송 완료::"+dto.getSeller()+"::"+dto.getGoodsInfo().getName();
    }

}
