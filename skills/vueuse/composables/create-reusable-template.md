# createReusableTemplate

在组件作用域内定义并重用模板。

**包：** `@vueuse/core`  
**类别：** 组件

## 用法

```ts
<template>
  <dialog v-if="showInDialog">
    <!-- 某些复杂内容 -->
  </dialog>
  <div v-else>
    <!-- 某些复杂内容 -->
  </div>
</template>
```

## 选项

| 选项           | 类型                                       | 默认值  | 描述                             |
| -------------- | ------------------------------------------ | ------- | -------------------------------- |
| inheritAttrs   | `boolean`                                  | true    | 从重用组件继承属性。             |
| props          | `ComponentObjectPropsOptions<Prop> `       | -       | 重用组件的属性定义。             |

## 参考

[VueUse 文档](https://vueuse.org/core/createReusableTemplate/)
