/**
 * 问卷管理表表头
 */
export const SurveyCols = [
  {
    label: "ID",
    prop: "id",
    width: "85",
    align: "left",
    fixed: "left"
  },
  {
    label: "问卷标题",
    prop: "title",
    width: "265",
    align: "left"
  },
  {
    label: "简介",
    prop: "introduction",
    width: "160",
    align: "left"
  },
  {
    label: "总题数",
    prop: "number",
    width: "45"
  },
  {
    label: "总用时",
    prop: "totalTime",
    width: "45"
  },
  {
    label: "创建时间",
    prop: "createdDate",
    width: "110"
  },
  {
    label: "修改时间",
    prop: "updateDate",
    width: "110"
  },
  {
    label: "创建者",
    prop: "creator",
    width: "85"
  },
  {
    label: "发布状态(暂停0/回收1)",
    prop: "status",
    width: "95"
  },
  {
    label: "问卷状态 (正常/封禁)",
    prop: "visibility",
    width: "95",
    switch: true,
    emit: "visibility"
  }
];
