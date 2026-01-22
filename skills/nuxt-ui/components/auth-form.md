# AuthForm

一个可自定义的表单，用于创建登录、注册或密码重置表单。

## 主要属性

- `fields`：作为对象数组，包含以下属性：

  - `name: string`{lang="ts-type"}
  - `type: 'checkbox' | 'select' | 'otp' | 'InputHTMLAttributes['type']'`{lang="ts-type"}

  每个字段必须包含一个 `type` 属性，该属性决定输入组件及应用的附加属性：`checkbox` 字段使用 [Checkbox](/docs/components/checkbox#props) 的属性，`select` 字段使用 [SelectMenu](/docs/components/select-menu#props) 的属性，`otp` 字段使用 [PinInput](/docs/components/pin-input#props) 的属性，其余类型则使用 [Input](/docs/components/input#props) 的属性。

- `title`：用于设置表单的标题。
- `description`：用于设置表单的描述。
- `icon`：用于设置表单的图标。
- `providers`：用于向表单添加提供商。
- `separator`：用于自定义 [Separator](/docs/components/separator) 组件，以分隔提供商与字段。
- `submit`：用于更改表单的提交按钮。

## 使用方法

```vue
<UAuthForm
  <!-- 在此处添加属性 -->
/>
```
