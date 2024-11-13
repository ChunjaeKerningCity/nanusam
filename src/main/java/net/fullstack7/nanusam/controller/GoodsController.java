package net.fullstack7.nanusam.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import net.fullstack7.nanusam.dto.FileDTO;
import net.fullstack7.nanusam.dto.GoodsDTO;
import net.fullstack7.nanusam.dto.PageRequestDTO;
import net.fullstack7.nanusam.service.GoodsService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
        if(bindingResult.hasErrors()) {
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
        if(bindingResult.hasErrors()) {
            log.info("registPost > bindingResult has errors");
            redirectAttributes.addFlashAttribute("errors", bindingResult.getAllErrors());
            return "redirect:/goods/regist.do";
        }



        log.info(goodsDTO.getName());
        log.info(goodsDTO.getPrice());
        goodsDTO.setMemberId(session.getAttribute("memberId").toString());
        goodsService.regist(goodsDTO);
        log.info(goodsDTO.getIdx());


        try {
            String message = upload(mainImage, goodsDTO.getIdx(), "goods_"+goodsDTO.getIdx()+"_0"+getExt(mainImage.getOriginalFilename()) );

            if(message != null) {
                redirectAttributes.addFlashAttribute("message", message);
            }

            int count = 1;
            for(MultipartFile detail : detailImage) {
                message = upload(detail, goodsDTO.getIdx(), "goods_"+goodsDTO.getIdx()+"_" + count++ +getExt(detail.getOriginalFilename()));
                if(message != null) {
                    redirectAttributes.addFlashAttribute("message", message);
                }
            }

        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("message", e.getMessage());
        }


        return "redirect:/goods/view.do?idx=" + goodsDTO.getIdx();
    }

    @GetMapping("/view.do")
    public String viewGet(@RequestParam(required = true) int idx, Model model) {
        model.addAttribute("item", goodsService.view(idx));
        return "goods/view";
    }

    @GetMapping("/modify.do")
    public String modifyGet(Model model) {
        model.addAttribute("categories", goodsService.codeList("goods"));
        return "goods/modify";
    }

    @PostMapping("/modify.do")
    public String modifyPost() {
        return "goods/modify";
    }

    @GetMapping("delete.do")
    public String deleteGet() {
        return "goods/delete";
    }

    private String uploadFile(String orgName, String newName, byte[] fileData) throws Exception {
        UUID uuid = UUID.randomUUID();
        String saveName = newName;
        File targetFile = new File(uploadDir, saveName);
        FileCopyUtils.copy(fileData, targetFile);
        return saveName;
    }

    private String upload(MultipartFile file, int refIdx, String name) throws Exception {
        String message = null;
        String newName = "";
        log.info("================================");
        log.info("UploadController >> uploadPOST START");
        try {
            if (file != null && !file.isEmpty()) {
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
                goodsService.fileupload(dto);
            }
        } catch (Exception e){
            log.info(e.getMessage());
            message = e.getMessage();
        }

        log.info("uploadDir : "+ uploadDir);
        log.info("orgName : "+ file.getOriginalFilename());
        log.info("newName : "+ newName);
        //log.info("ext : "+ file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf(".")));
        log.info("ext : "+ Objects.requireNonNull(file.getOriginalFilename()).substring(file.getOriginalFilename().lastIndexOf(".")));
        log.info("size : "+ file.getSize());
        log.info("contentType : "+ file.getContentType());
        log.info("UploadController >> uploadPOST END");
        log.info("================================");

        return message;
    }

    String getExt(String filename) {
        return filename.substring(filename.lastIndexOf("."));
    }
}
