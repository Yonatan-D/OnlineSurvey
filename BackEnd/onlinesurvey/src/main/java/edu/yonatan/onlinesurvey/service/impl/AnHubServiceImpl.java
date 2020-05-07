package edu.yonatan.onlinesurvey.service.impl;

import edu.yonatan.onlinesurvey.dao.AnCheckboxMapper;
import edu.yonatan.onlinesurvey.dao.AnRadioMapper;
import edu.yonatan.onlinesurvey.entity.AnCheckbox;
import edu.yonatan.onlinesurvey.entity.AnRadio;
import edu.yonatan.onlinesurvey.service.AnHubService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.UUID;

@Service
public class AnHubServiceImpl implements AnHubService {
    @Autowired
    private AnRadioMapper anRadioMapper;
    @Autowired
    private AnCheckboxMapper anCheckboxMapper;

    /**
     * 查询一组单选题选项
     * @param qsItemId
     * @return
     */
    @Override
    public List<AnRadio> findOptionsOfRadio(String qsItemId) {
        return  anRadioMapper.selectOptionsByQsItemId(qsItemId);
    }

    /**
     * 查询一个单选题选项
     * @param id
     * @return
     */
    @Override
    public String findOptionOfRadio(String id) {
        return anRadioMapper.selectOptionsById(id);
    }

    /**
     * 添加单选题选项
     * @param anRadio
     */
    @Override
    public void addOptionOfRadio(AnRadio anRadio) {
        String id = UUID.randomUUID().toString().replaceAll("-","");
        anRadio.setId(id);
        anRadioMapper.insertOption(anRadio);
    }

    /**
     * 修改单选题选项
     * @param anRadio
     */
    @Override
    public void editOptionOfRadio(AnRadio anRadio) {
        anRadioMapper.updateOptionById(anRadio);
    }

    /**
     * 删除一个单选题选项
     * @param id
     */
    @Override
    public void deleteOptionOfRadio(String id) {
        anRadioMapper.deleteOptionById(id);
    }

    /**
     * 删除一组单选题选项
     * @param qsItemId
     */
    @Override
    public void deleteOptionOfRadioByGroup(String qsItemId) {
        anRadioMapper.deleteOptionByQsItemId(qsItemId);
    }

    /**
     * 查询一组多选题选项
     * @param qsItemId
     * @return
     */
    @Override
    public List<AnCheckbox> findOptionsOfCheckbox(String qsItemId) {
        return anCheckboxMapper.selectOptionsByQsItemId(qsItemId);
    }

    /**
     * 查询一个多选题选项
     * @param id
     * @return
     */
    @Override
    public String findOptionOfCheckbox(String id) {
        return anCheckboxMapper.selectOptionsById(id);
    }

    /**
     * 添加多选题选项
     * @param anCheckbox
     */
    @Override
    public void addOptionOfCheckbox(AnCheckbox anCheckbox) {
        String id = UUID.randomUUID().toString().replaceAll("-","");
        anCheckbox.setId(id);
        anCheckboxMapper.insertOption(anCheckbox);
    }

    /**
     * 修改多选题选项
     * @param anCheckbox
     */
    @Override
    public void editOptionOfCheckbox(AnCheckbox anCheckbox) {
        anCheckboxMapper.updateOptionById(anCheckbox);
    }

    /**
     * 删除一个多选题选项
     * @param id
     */
    @Override
    public void deleteOptionOfCheckbox(String id) {
        anCheckboxMapper.deleteOptionById(id);
    }

    /**
     * 删除一组多选题选项
     * @param qsItemId
     */
    @Override
    public void deleteOptionOfCheckboxByGroup(String qsItemId) {
        anCheckboxMapper.deleteOptionByQsItemId(qsItemId);
    }
}
