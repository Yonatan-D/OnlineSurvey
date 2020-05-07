/**
 * 用户管理表表头
 */
export const UserCols = [
  {
    label: "ID",
    prop: "id",
    width: "85",
    align: "left",
    fixed: "left"
  },
  {
    label: "用户名",
    prop: "username",
    width: ""
  },
  {
    label: "邮箱",
    prop: "email",
    width: ""
  },
  {
    label: "注册时间",
    prop: "createdDate",
    width: ""
  },
  {
    label: "最后一次登录时间",
    prop: "lastLoginDate",
    width: ""
  },
  {
    label: "账号状态 (正常/封禁)",
    prop: "status",
    width: "155",
    switch: true,
    emit: "status"
  }
];