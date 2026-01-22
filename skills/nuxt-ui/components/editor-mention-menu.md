# EditorMentionMenu

当在编辑器中输入 @ 字符时，显示用户建议的提及菜单。

## 主要属性

- `items`：由以下属性组成的对象数组：

  - `label: string`{lang="ts-type"}
  - `avatar?: AvatarProps`{lang="ts-type"}
  - `icon?: string`{lang="ts-type"}
  - `description?: string`{lang="ts-type"}
  - `disabled?: boolean`{lang="ts-type"}

## ::component-example

elevated: true
collapse: true
name: 'editor-mention-menu-items-example'
class: 'p-8'

---

::

::note
你也可以将数组的数组传递给 `items` 属性，以创建分组项。

- `char`：用于更改触发字符。
- `options`：用于使用 [Floating UI 选项](https://floating-ui.com/docs) 自定义定位行为。

## 使用方法

```vue
<UEditorMentionMenu
  <!-- 在此处传入属性 -->
/>
```
