# EditorSuggestionMenu

当在编辑器中输入 / 字符时，显示格式化和操作建议的命令菜单。

## 主要属性

- `items`：由以下属性组成的对象数组：

- [`kind?: "textAlign" | "heading" | "link" | "image" | "blockquote" | "bulletList" | "orderedList" | "codeBlock" | "horizontalRule" | "paragraph" | "clearFormatting" | "duplicate" | "delete" | "moveUp" | "moveDown" | "suggestion" | "mention" | "emoji"`{lang="ts-type"}](/docs/components/editor#handlers)
- `label?: string`{lang="ts-type"}
- `description?: string`{lang="ts-type"}
- `icon?: string`{lang="ts-type"}
- `type?: "label" | "separator"`{lang="ts-type"}
- `disabled?: boolean`{lang="ts-type"}

## ::component-example

elevated: true
collapse: true
name: 'editor-suggestion-menu-items-example'
class: 'p-8'

---

::

::note
您还可以将数组的数组传递给 `items` 属性，以创建分组项目。

- `char`：用于更改触发字符。
- `options`：用于使用 [Floating UI 选项](https://floating-ui.com/docs) 自定义定位行为。

## 使用方法

```vue
<UEditorSuggestionMenu
  <!-- 这里放置属性 -->
/>
```
