package net.fullstack7.nanusam.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import net.fullstack7.nanusam.dto.FileDTO;
import net.fullstack7.nanusam.dto.GoodsDTO;
import net.fullstack7.nanusam.dto.PageRequestDTO;
import net.fullstack7.nanusam.service.GoodsService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.CollectionUtils;
import org.springframework.util.FileCopyUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.io.File;
import java.util.List;
import java.util.Objects;
import java.util.UUID;

@Controller
@RequiredArgsConstructor
@Log4j2
@RequestMapping("/goods")
public class GoodsController {
    private final GoodsService goodsService;
    private final String uploadDir = "D:\\java7\\nanusam\\src\\main\\webapp\\resources\\image";

    @GetMapping("/list.do")
    public String list(Model model, @Valid PageRequestDTO pageRequestDTO, BindingResult bindingResult, RedirectAttributes redirectAttributes) {
        if (bindingResult.hasErrors()) {
            redirectAttributes.addFlashAttribute("errors", bindingResult.getAllErrors());
            return "redirect:/goods/list.do";
        }
        model.addAttribute("pageinfo", goodsService.listByPage(pageRequestDTO));
        model.addAttribute("categories", goodsService.codeList("goods"));
        return "goods/list";
    }

    @GetMapping("/regist.do")
    public String registGet(Model model) {
        model.addAttribute("categories", goodsService.codeList("goods"));
        return "goods/regist";
    }

    @PostMapping("/regist.do")
    public String registPost(HttpSession session, @RequestParam(required = false) MultipartFile mainImage, @RequestParam(required = false) MultipartFile[] detailImage, @Valid GoodsDTO goodsDTO, BindingResult bindingResult, RedirectAttributes redirectAttributes) {
        log.info(goodsDTO.toString());
        if (bindingResult.hasErrors()) {
            log.info("registPost > bindingResult has errors");
            redirectAttributes.addFlashAttribute("formerrors", bindingResult.getAllErrors());
            return "redirect:/goods/regist.do";
        }

        goodsDTO.setMemberId(session.getAttribute("memberId").toString());
        String message = goodsService.regist(goodsDTO);

        if (message != null) {
            redirectAttributes.addFlashAttribute("errors", message);
            return "redirect:/goods/regist.do";
        }

        try {
            message = upload(mainImage, goodsDTO.getIdx(), "goods_" + goodsDTO.getIdx() + "_0" + getExt(mainImage.getOriginalFilename()));

            if (message != null) {
                redirectAttributes.addFlashAttribute("errors", message);
            }

            if(detailImage != null && detailImage.length > 0) {
                for (MultipartFile detail : detailImage) {
                    if(detail.getSize() > 0) {
                        message = upload(detail, goodsDTO.getIdx(), "goods_" + goodsDTO.getIdx() + "_z" + UUID.randomUUID().toString() + getExt(detail.getOriginalFilename()));
                        if (message != null) {
                            redirectAttributes.addFlashAttribute("errors", message);
                        }
                    }
                }
            }
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("errors", e.getMessage());
        }


        return "redirect:/goods/view.do?idx=" + goodsDTO.getIdx();
    }

    @GetMapping("/view.do")
    public String viewGet(@RequestParam(required = true, defaultValue = "0") int idx, Model model, RedirectAttributes redirectAttributes) {
        if (idx == 0) {
            redirectAttributes.addFlashAttribute("errors", "등록되지 않은 상품입니다.");
            return "redirect:/goods/list.do";
        }
        model.addAttribute("item", goodsService.view(idx));
        return "goods/view";
    }

    @GetMapping("/modify.do")
    public String modifyGet(HttpSession session, Model model, @RequestParam(required = false, defaultValue = "0") int idx, RedirectAttributes redirectAttributes) {

        if (idx == 0) {
            redirectAttributes.addFlashAttribute("errors", "등록되지 않은 상품입니다.");
            return "redirect:/goods/list.do";
        }

        GoodsDTO goodsDTO = goodsService.view(idx);

        if (session.getAttribute("memberId") == null || !session.getAttribute("memberId").equals(goodsDTO.getMemberId())) {
            redirectAttributes.addFlashAttribute("errors", "수정 권한이 없습니다.");
            return "redirect:/goods/view.do?idx=" + idx;
        }

        model.addAttribute("categories", goodsService.codeList("goods"));
        model.addAttribute("item", goodsDTO);
        List<FileDTO> list = goodsService.fileListByBbsCodeAndRefIdx("상품", idx);


        model.addAttribute("orgMainImage", list.remove(0));
        model.addAttribute("images", list);
        return "goods/modify";
    }

    @PostMapping("/modify.do")
    public String modifyPost(@RequestParam(required = false, defaultValue = "0") int idx
            , @Valid GoodsDTO goodsDTO, BindingResult bindingResult, RedirectAttributes redirectAttributes
            , HttpSession session
            , @RequestParam(required = false) String[] deleteFile
            , @RequestParam(required = false) MultipartFile mainImage, @RequestParam(required = false) MultipartFile[] detailImage) {

        if (idx == 0) {
            redirectAttributes.addFlashAttribute("errors", "등록되지 않은 상품입니다.");
            return "redirect:/goods/list.do";
        }

        goodsDTO.setMemberId(session.getAttribute("memberId").toString());
        String message = goodsService.modifyGoodsInfo(goodsDTO);
        if (message != null) {
            redirectAttributes.addFlashAttribute("errors", message);
            return "redirect:/goods/modify.do?idx=" + goodsDTO.getIdx();
        }


        if (deleteFile != null && deleteFile.length > 0) {
            for (String filename : deleteFile) {
                File dfile = new File(uploadDir, filename);
                dfile.delete();
                goodsService.deleteFileByName(filename);
            }
        }


            try {
                if(mainImage != null && mainImage.getSize() > 0) {
                    message = upload(mainImage, goodsDTO.getIdx(), "goods_" + goodsDTO.getIdx() + "_0" + getExt(mainImage.getOriginalFilename()));
                }


                if (message != null) {
                    redirectAttributes.addFlashAttribute("errors", message);
                }

                if(detailImage != null && detailImage.length > 0) {
                    for (MultipartFile detail : detailImage) {
                        if(detail.getSize() > 0) {
                            message = upload(detail, goodsDTO.getIdx(), "goods_" + goodsDTO.getIdx() + "_z" + UUID.randomUUID().toString() + getExt(detail.getOriginalFilename()));
                            if (message != null) {
                                redirectAttributes.addFlashAttribute("errors", message);
                            }
                        }
                    }
                }

            } catch (Exception e) {
                redirectAttributes.addFlashAttribute("errors", e.getMessage());
                return "redirect:/goods/modify.do?idx=" + goodsDTO.getIdx();
            }


        if (message != null) {
            redirectAttributes.addFlashAttribute("errors", message);
            return "redirect:/goods/modify.do?idx=" + goodsDTO.getIdx();
        }
        return "redirect:/goods/view.do?idx=" + goodsDTO.getIdx();
    }

    @GetMapping("delete.do")
    public String deleteGet() {
        return "goods/delete";
    }

    private String uploadFile(String orgName, String newName, byte[] fileData) throws Exception {
        String saveName = newName;
        File targetFile = new File(uploadDir, saveName);
        FileCopyUtils.copy(fileData, targetFile);
        return saveName;
    }

    private String upload(MultipartFile file, int refIdx, String name) throws Exception {
        log.info("0");
        String message = null;
        String newName = "";
        log.info("================================");
        log.info("UploadController >> uploadPOST START");
        try {
            log.info("1");
            if (file != null && !file.isEmpty()) {
                log.info("2");
                FileDTO dto = new FileDTO();
                dto.setRefIdx(refIdx);
                dto.setFilePath(uploadDir);
                //dto.setFileName(file.getOriginalFilename());
                newName = uploadFile(file.getOriginalFilename(), name, file.getBytes());
                dto.setFileName(newName);
                dto.setFileExt(Objects.requireNonNull(file.getOriginalFilename()).substring(file.getOriginalFilename().lastIndexOf(".")));
                dto.setFileContentType(file.getContentType());
                dto.setFileSize(file.getSize());
//                dto.setFileData(mainImage.getBytes());
                dto.setBbsCode("상품");
                dto.setOrgFileName(file.getOriginalFilename());
                message = goodsService.fileupload(dto);
            }
        } catch (Exception e) {
            log.info("3");
            log.info(e.getMessage());
            message = e.getMessage();
            log.info("upload " + message);
        }

        log.info("uploadDir : " + uploadDir);
        log.info("orgName : " + file.getOriginalFilename());
        log.info("newName : " + newName);
        //log.info("ext : "+ file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf(".")));
        log.info("ext : " + Objects.requireNonNull(file.getOriginalFilename()).substring(file.getOriginalFilename().lastIndexOf(".")));
        log.info("size : " + file.getSize());
        log.info("contentType : " + file.getContentType());
        log.info("UploadController >> uploadPOST END");
        log.info("================================");

        return message;
    }

    String getExt(String filename) {
        return Objects.requireNonNull(filename.substring(filename.lastIndexOf(".")));
    }
}
