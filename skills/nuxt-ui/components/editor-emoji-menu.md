# EditorEmojiMenu

一个表情符号选择菜单，在编辑器中输入冒号（:）时显示表情符号建议。

## 主要属性

- `items`：由以下属性组成的对象数组：

  - `name: string`{lang="ts-type"}
  - `emoji: string`{lang="ts-type"}
  - `shortcodes?: string[]`{lang="ts-type"}
  - `tags?: string[]`{lang="ts-type"}
  - `group?: string`{lang="ts-type"}
  - `fallbackImage?: string`{lang="ts-type"}

## ::component-example

elevated: true
collapse: true
name: 'editor-emoji-menu-items-example'
class: 'p-8'

---

::

::note
你也可以将数组的数组传递给 `items` 属性，以创建分组项。

- `char`：用于更改触发字符。
- `options`：用于使用 [Floating UI 选项](https://floating-ui.com/docs/options) 自定义定位行为。

## 使用方法

```vue
<UEditorEmojiMenu
  <!-- 在此处传入属性 -->
/>
```
