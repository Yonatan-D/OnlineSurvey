package edu.yonatan.onlinesurvey.service;

import edu.yonatan.onlinesurvey.entity.AnCheckbox;
import edu.yonatan.onlinesurvey.entity.AnRadio;

import java.util.List;

public interface AnHubService {
    // 查询一组单选题选项
    List<AnRadio> findOptionsOfRadio(String qsItemId);
    // 查询一个单选题选项
    String findOptionOfRadio(String id);
    // 添加单选题选项
    void addOptionOfRadio(AnRadio anRadio);
    // 修改单选题选项
    void editOptionOfRadio(AnRadio anRadio);
    // 删除一个单选题选项
    void deleteOptionOfRadio(String id);
    // 删除一组单选题选项
    void deleteOptionOfRadioByGroup(String qsItemId);
    // 查询一组多选题选项
    List<AnCheckbox> findOptionsOfCheckbox(String qsItemId);
    // 查询一个多选题选项
    String findOptionOfCheckbox(String id);
    // 添加多选题选项
    void addOptionOfCheckbox(AnCheckbox anCheckbox);
    // 修改多选题选项
    void editOptionOfCheckbox(AnCheckbox anCheckbox);
    // 删除一个多选题选项
    void deleteOptionOfCheckbox(String id);
    // 删除一组多选题选项
    void deleteOptionOfCheckboxByGroup(String qsItemId);
}
