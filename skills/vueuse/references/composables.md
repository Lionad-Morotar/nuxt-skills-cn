# VueUse 组合式函数

> 自动生成。运行 `npx tsx skills/vueuse/scripts/generate-composables.ts` 来更新。

## '@Electron'

| 组合式函数           | 描述                                                  | 文件                                                                    |
| -------------------- | ------------------------------------------------------------ | ----------------------------------------------------------------------- |
| useIpcRenderer       | 提供 ipcRenderer 及其所有 API。                    | [use-ipc-renderer.md](../composables/use-ipc-renderer.md)               |
| useIpcRendererInvoke | 响应式的 ipcRenderer.invoke API 结果。使异步调用成为可能... | [use-ipc-renderer-invoke.md](../composables/use-ipc-renderer-invoke.md) |
| useIpcRendererOn     | 使用 ipcRenderer.on 轻松监听事件并移除监听器... | [use-ipc-renderer-on.md](../composables/use-ipc-renderer-on.md)         |
| useZoomFactor        | 响应式的 WebFrame 缩放比例。                               | [use-zoom-factor.md](../composables/use-zoom-factor.md)                 |
| useZoomLevel         | 响应式的 WebFrame 缩放级别。                                | [use-zoom-level.md](../composables/use-zoom-level.md)                   |

## '@Firebase'

| 组合式函数   | 描述                                                  | 文件                                                |
| ------------ | ------------------------------------------------------------ | --------------------------------------------------- |
| useAuth      | 响应式的 Firebase 认证绑定。它提供了一个响应式的... | [use-auth.md](../composables/use-auth.md)           |
| useFirestore | 响应式的 Firestore 绑定。使其便于使用... | [use-firestore.md](../composables/use-firestore.md) |
| useRTDB      | 响应式的 Firebase 实时数据库绑定。使其更加容易使用... | [use-rtdb.md](../composables/use-rtdb.md)           |

## '@Integrations'

| 组合式函数        | 描述                                                  | 文件                                                            |
| ----------------- | ------------------------------------------------------------ | --------------------------------------------------------------- |
| useAsyncValidator | . 的包装器。                                                | [use-async-validator.md](../composables/use-async-validator.md) |
| useAxios          | . 的包装器。                                                | [use-axios.md](../composables/use-axios.md)                     |
| useChangeCase     | . 的响应式包装器。                                       | [use-change-case.md](../composables/use-change-case.md)         |
| useCookies        | . 的包装器。                                                | [use-cookies.md](../composables/use-cookies.md)                 |
| useDrauu          | drauu 的响应式实例。                                 | [use-drauu.md](../composables/use-drauu.md)                     |
| useFocusTrap      | . 的响应式包装器。                                       | [use-focus-trap.md](../composables/use-focus-trap.md)           |
| useFuse           | 使用 Fuse 实现模糊搜索的组合式函数。 | [use-fuse.md](../composables/use-fuse.md)                       |
| useIDBKeyval      | . 的包装器。                                                | [use-idbkeyval.md](../composables/use-idbkeyval.md)             |
| useJwt            | . 的包装器。                                                | [use-jwt.md](../composables/use-jwt.md)                         |
| useNProgress      | . 的响应式包装器。                                       | [use-nprogress.md](../composables/use-nprogress.md)             |
| useQRCode         | . 的包装器。                                                | [use-qrcode.md](../composables/use-qrcode.md)                   |
| useSortable       | . 的包装器。                                                | [use-sortable.md](../composables/use-sortable.md)               |

## '@Math'

| 组合式函数              | 描述                                                  | 文件                                                                        |
| ----------------------- | ------------------------------------------------------------ | --------------------------------------------------------------------------- |
| createGenericProjection | . 的通用版本。接受一个自定义投影函数... | [create-generic-projection.md](../composables/create-generic-projection.md) |
| createProjection        | 从一个域到另一个域的响应式数值投影。      | [create-projection.md](../composables/create-projection.md)                 |
| logicAnd                | ref 的条件。                                          | [logic-and.md](../composables/logic-and.md)                                 |
| logicNot                | ref 的条件。                                           | [logic-not.md](../composables/logic-not.md)                                 |
| logicOr                 | ref 的条件。                                         | [logic-or.md](../composables/logic-or.md)                                   |
| useAbs                  | 响应式 .                                                   | [use-abs.md](../composables/use-abs.md)                                     |
| useAverage              | 反应式获取数组的平均值。                      | [use-average.md](../composables/use-average.md)                             |
| useCeil                 | 响应式                                                     | [use-ceil.md](../composables/use-ceil.md)                                   |
| useClamp                | 响应式限制一个值在两个其他值之间。           | [use-clamp.md](../composables/use-clamp.md)                                 |
| useFloor                | 响应式 .                                                   | [use-floor.md](../composables/use-floor.md)                                 |
| useMath                 | 响应式方法。                                            | [use-math.md](../composables/use-math.md)                                   |
| useMax                  | 响应式 .                                                   | [use-max.md](../composables/use-max.md)                                     |
| useMin                  | 响应式 .                                                   | [use-min.md](../composables/use-min.md)                                     |
| usePrecision            | 响应式设置数字的精度。                    | [use-precision.md](../composables/use-precision.md)                         |
| useProjection           | 从一个域到另一个域的响应式数值投影。      | [use-projection.md](../composables/use-projection.md)                       |
| useRound                | 响应式 .                                                   | [use-round.md](../composables/use-round.md)                                 |
| useSum                  | 反应式获取数组的总和                           | [use-sum.md](../composables/use-sum.md)                                     |
| useTrunc                | 响应式 .                                                   | [use-trunc.md](../composables/use-trunc.md)                                 |

## '@Router'

| 组合式函数     | 描述                | 文件                                                      |
| -------------- | -------------------------- | --------------------------------------------------------- |
| useRouteHash   | 一个响应式的简写。 | [use-route-hash.md](../composables/use-route-hash.md)     |
| useRouteParams | 一个响应式的简写。 | [use-route-params.md](../composables/use-route-params.md) |
| useRouteQuery  | 一个响应式的简写。 | [use-route-query.md](../composables/use-route-query.md)   |

## '@RxJS'

| 组合式函数               | 描述                                                  | 文件                                                                          |
| ------------------------ | ------------------------------------------------------------ | ----------------------------------------------------------------------------- |
| from                     | RxJS 的包装器，允许它们接受 s。        | [from.md](../composables/from.md)                                             |
| toObserver               | 将一个转换为 RxJS Observer 的糖函数。           | [to-observer.md](../composables/to-observer.md)                               |
| useExtractedObservable   | 使用一个从一个或多个组合式函数中提取的 RxJS，... | [use-extracted-observable.md](../composables/use-extracted-observable.md)     |
| useObservable            | 使用一个 RxJS，返回一个，并自动取消订阅... | [use-observable.md](../composables/use-observable.md)                         |
| useSubject               | 将一个 RxJS 绑定到一个并双向传播值变化。     | [use-subject.md](../composables/use-subject.md)                               |
| useSubscription          | 使用一个 RxJS，无需担心取消订阅... | [use-subscription.md](../composables/use-subscription.md)                     |
| watchExtractedObservable | 观察从一个或多个组合式函数中提取的 RxJS 的值... | [watch-extracted-observable.md](../composables/watch-extracted-observable.md) |

## Animation

| 组合式函数    | 描述                                                  | 文件                                                    |
| ------------- | ------------------------------------------------------------ | ------------------------------------------------------- |
| useAnimate    | 响应式的 Web 动画 API。                                 | [use-animate.md](../composables/use-animate.md)         |
| useInterval   | 响应式的计数器，在每个间隔递增                 | [use-interval.md](../composables/use-interval.md)       |
| useIntervalFn | . 的包装器，带有控制功能                                    | [use-interval-fn.md](../composables/use-interval-fn.md) |
| useNow        | 响应式的当前 Date 实例。                              | [use-now.md](../composables/use-now.md)                 |
| useRafFn      | 在每次调用函数时。带有暂停和恢复控制... | [use-raf-fn.md](../composables/use-raf-fn.md)           |
| useTimeout    | 在给定时间后更新值，带有控制功能。               | [use-timeout.md](../composables/use-timeout.md)         |
| useTimeoutFn  | . 的包装器，带有控制功能。                                   | [use-timeout-fn.md](../composables/use-timeout-fn.md)   |
| useTimestamp  | 响应式的当前时间戳                                   | [use-timestamp.md](../composables/use-timestamp.md)     |
| useTransition | 在值之间过渡                                    | [use-transition.md](../composables/use-transition.md)   |

## Array

| 组合式函数         | 描述                                  | 文件                                                              |
| ------------------ | -------------------------------------------- | ----------------------------------------------------------------- |
| useArrayDifference | 响应式获取两个数组的差集。 | [use-array-difference.md](../composables/use-array-difference.md) |
| useArrayEvery      | 响应式                                     | [use-array-every.md](../composables/use-array-every.md)           |
| useArrayFilter     | 响应式                                     | [use-array-filter.md](../composables/use-array-filter.md)         |
| useArrayFind       | 响应式 .                                   | [use-array-find.md](../composables/use-array-find.md)             |
| useArrayFindIndex  | 响应式                                     | [use-array-find-index.md](../composables/use-array-find-index.md) |
| useArrayFindLast   | 响应式 .                                   | [use-array-find-last.md](../composables/use-array-find-last.md)   |
| useArrayIncludes   | 响应式                                     | [use-array-includes.md](../composables/use-array-includes.md)     |
| useArrayJoin       | 响应式                                     | [use-array-join.md](../composables/use-array-join.md)             |
| useArrayMap        | 响应式                                     | [use-array-map.md](../composables/use-array-map.md)               |
| useArrayReduce     | 响应式 .                                   | [use-array-reduce.md](../composables/use-array-reduce.md)         |
| useArraySome       | 响应式                                     | [use-array-some.md](../composables/use-array-some.md)             |
| useArrayUnique     | 响应式唯一数组                        | [use-array-unique.md](../composables/use-array-unique.md)         |
| useSorted          | 响应式排序数组                          | [use-sorted.md](../composables/use-sorted.md)                     |

## Browser

| 组合式函数                      | 描述                                                  | 文件                                                                                          |
| ------------------------------- | ------------------------------------------------------------ | --------------------------------------------------------------------------------------------- |
| useBluetooth                    | 响应式的 Web 蓝牙 API。提供连接能力... | [use-bluetooth.md](../composables/use-bluetooth.md)                                           |
| useBreakpoints                  | 响应式的视口断点。                               | [use-breakpoints.md](../composables/use-breakpoints.md)                                       |
| useBroadcastChannel             | 响应式的 BroadcastChannel API。                               | [use-broadcast-channel.md](../composables/use-broadcast-channel.md)                           |
| useBrowserLocation              | 响应式的浏览器位置                                    | [use-browser-location.md](../composables/use-browser-location.md)                             |
| useClipboard                    | 响应式的 Clipboard API。提供响应能力... | [use-clipboard.md](../composables/use-clipboard.md)                                           |
| useClipboardItems               | 响应式的 Clipboard API。提供响应能力... | [use-clipboard-items.md](../composables/use-clipboard-items.md)                               |
| useColorMode                    | 响应式的颜色模式（深色 / 浅色 / 自定义）以及自动数据持久化。 | [use-color-mode.md](../composables/use-color-mode.md)                                         |
| useCssVar                       | 操作 CSS 变量                                     | [use-css-var.md](../composables/use-css-var.md)                                               |
| useDark                         | 响应式的深色模式及自动数据持久化。               | [use-dark.md](../composables/use-dark.md)                                                     |
| useEventListener                | 轻松使用 EventListener。注册使用 addEventListener... | [use-event-listener.md](../composables/use-event-listener.md)                                 |
| useEyeDropper                   | 响应式的 EyeDropper API                                      | [use-eye-dropper.md](../composables/use-eye-dropper.md)                                       |
| useFavicon                      | 响应式的 favicon                                             | [use-favicon.md](../composables/use-favicon.md)                                               |
| useFileDialog                   | 轻松打开文件对话框。                                  | [use-file-dialog.md](../composables/use-file-dialog.md)                                       |
| useFileSystemAccess             | 使用 FileSystemAccess 创建和读写本地文件。 | [use-file-system-access.md](../composables/use-file-system-access.md)                         |
| useFullscreen                   | 响应式的 Fullscreen API。它添加了呈现特定元素的方法... | [use-fullscreen.md](../composables/use-fullscreen.md)                                         |
| useGamepad                      | 提供对 Gamepad API 的响应式绑定。              | [use-gamepad.md](../composables/use-gamepad.md)                                               |
| useImage                        | 响应式加载浏览器中的图像，你可以等待其... | [use-image.md](../composables/use-image.md)                                                   |
| useMediaControls                | 响应式的媒体控制，适用于和元素                | [use-media-controls.md](../composables/use-media-controls.md)                                 |
| useMediaQuery                   | 响应式的 Media Query。一旦你创建了 MediaQueryList... | [use-media-query.md](../composables/use-media-query.md)                                       |
| useMemory                       | 响应式的内存信息。                                        | [use-memory.md](../composables/use-memory.md)                                                 |
| useObjectUrl                    | 响应式的表示对象的 URL。                         | [use-object-url.md](../composables/use-object-url.md)                                         |
| usePerformanceObserver          | 观察性能指标。                                 | [use-performance-observer.md](../composables/use-performance-observer.md)                     |
| usePermission                   | 响应式的 Permissions API。Permissions API 提供... | [use-permission.md](../composables/use-permission.md)                                         |
| usePreferredColorScheme         | 响应式的 prefers-color-scheme 媒体查询。                   | [use-preferred-color-scheme.md](../composables/use-preferred-color-scheme.md)                 |
| usePreferredContrast            | 响应式的 prefers-contrast 媒体查询。                       | [use-preferred-contrast.md](../composables/use-preferred-contrast.md)                         |
| usePreferredDark                | 响应式的深色主题偏好。                              | [use-preferred-dark.md](../composables/use-preferred-dark.md)                                 |
| usePreferredLanguages           | 响应式的 Navigator Languages。它为 Web 开发者... | [use-preferred-languages.md](../composables/use-preferred-languages.md)                       |
| usePreferredReducedMotion       | 响应式的 prefers-reduced-motion 媒体查询。                 | [use-preferred-reduced-motion.md](../composables/use-preferred-reduced-motion.md)             |
| usePreferredReducedTransparency | 响应式的 prefers-reduced-transparency 媒体查询。           | [use-preferred-reduced-transparency.md](../composables/use-preferred-reduced-transparency.md) |
| useScreenOrientation            | 响应式的屏幕方向 API。它为 Web 开发者... | [use-screen-orientation.md](../composables/use-screen-orientation.md)                         |
| useScreenSafeArea               | 响应式                                                     | [use-screen-safe-area.md](../composables/use-screen-safe-area.md)                             |
| useScriptTag                    | 创建一个 script 标签，支持自动卸载... | [use-script-tag.md](../composables/use-script-tag.md)                                         |
| useShare                        | 响应式的 Web Share API。浏览器提供功能... | [use-share.md](../composables/use-share.md)                                                   |
| useSSRWidth                     | 用于设置全局视口宽度，将在... | [use-ssrwidth.md](../composables/use-ssrwidth.md)                                             |
| useStyleTag                     | 在 head 中注入响应式元素。                             | [use-style-tag.md](../composables/use-style-tag.md)                                           |
| useTextareaAutosize             | 根据内容自动更新文本区域的高度。                           | [use-textarea-autosize.md](../composables/use-textarea-autosize.md)                           |
| useTextDirection                | 响应式元素的文本方向。                          | [use-text-direction.md](../composables/use-text-direction.md)                                 |
| useTitle                        | 响应式的文档标题。                                     | [use-title.md](../composables/use-title.md)                                                   |
| useUrlSearchParams              | 响应式的 URLSearchParams                                     | [use-url-search-params.md](../composables/use-url-search-params.md)                           |
| useVibrate                      | 响应式的振动 API                                       | [use-vibrate.md](../composables/use-vibrate.md)                                               |
| useWakeLock                     | 响应式的屏幕唤醒锁 API。提供防止... | [use-wake-lock.md](../composables/use-wake-lock.md)                                           |
| useWebNotification              | 响应式的通知                                        | [use-web-notification.md](../composables/use-web-notification.md)                             |
| useWebWorker                    | 简单的 Web Workers 注册和通信。           | [use-web-worker.md](../composables/use-web-worker.md)                                         |
| useWebWorkerFn                  | 使用 Web Workers 运行昂贵函数而不阻塞 UI。 | [use-web-worker-fn.md](../composables/use-web-worker-fn.md)                                   |

## Component

| 组合式函数             | 描述                                                  | 文件                                                                      |
| ---------------------- | ------------------------------------------------------------ | ------------------------------------------------------------------------- |
| computedInject         | 结合 computed 和 inject                                  | [computed-inject.md](../composables/computed-inject.md)                   |
| createReusableTemplate | 在组件作用域内定义并重用模板。        | [create-reusable-template.md](../composables/create-reusable-template.md) |
| createTemplatePromise  | 模板作为 Promise。对于构建自定义对话框非常有用... | [create-template-promise.md](../composables/create-template-promise.md)   |
| templateRef            |                                                              | [template-ref.md](../composables/template-ref.md)                         |
| tryOnBeforeMount       | 安全的 . 如果在组件生命周期中调用，否则... | [try-on-before-mount.md](../composables/try-on-before-mount.md)           |
| tryOnBeforeUnmount     | 安全的 . 如果在组件生命周期中调用，否则... | [try-on-before-unmount.md](../composables/try-on-before-unmount.md)       |
| tryOnMounted           | 安全的 . 如果在组件生命周期中调用，否则... | [try-on-mounted.md](../composables/try-on-mounted.md)                     |
| tryOnScopeDispose      | 安全的 . 如果在 effect 作用域生命周期中调用，否则... | [try-on-scope-dispose.md](../composables/try-on-scope-dispose.md)         |
| tryOnUnmounted         | 安全的 . 如果在组件生命周期中调用，否则... | [try-on-unmounted.md](../composables/try-on-unmounted.md)                 |
| unrefElement           | 从 Vue ref 或组件中获取底层 DOM 元素。 | [unref-element.md](../composables/unref-element.md)                       |
| useCurrentElement      | 以 ref 的形式获取当前组件的 DOM 元素。           | [use-current-element.md](../composables/use-current-element.md)           |
| useMounted             | mounted 状态在 ref 中。                                        | [use-mounted.md](../composables/use-mounted.md)                           |
| useTemplateRefsList    | 绑定 refs 到模板元素和组件的简写。     | [use-template-refs-list.md](../composables/use-template-refs-list.md)     |
| useVirtualList         |                                                              | [use-virtual-list.md](../composables/use-virtual-list.md)                 |
| useVModel              | v-model 绑定的简写，props + emit -> ref           | [use-vmodel.md](../composables/use-vmodel.md)                             |
| useVModels             | props v-model 绑定的简写。思考为但更... | [use-vmodels.md](../composables/use-vmodels.md)                           |

## Elements

| 组合式函数              | 描述                                                  | 文件                                                                        |
| ----------------------- | ------------------------------------------------------------ | --------------------------------------------------------------------------- |
| useActiveElement        | 响应式                                                     | [use-active-element.md](../composables/use-active-element.md)               |
| useDocumentVisibility   | 反应式追踪                                             | [use-document-visibility.md](../composables/use-document-visibility.md)     |
| useDraggable            | 使元素可拖拽。                                     | [use-draggable.md](../composables/use-draggable.md)                         |
| useDropZone             | 创建一个文件可以被拖放的区域。                    | [use-drop-zone.md](../composables/use-drop-zone.md)                         |
| useElementBounding      | HTML 元素的响应式边界框                     | [use-element-bounding.md](../composables/use-element-bounding.md)           |
| useElementSize          | HTML 元素的响应式大小。ResizeObserver MDN         | [use-element-size.md](../composables/use-element-size.md)                   |
| useElementVisibility    | 跟踪元素在视口内的可见性。     | [use-element-visibility.md](../composables/use-element-visibility.md)       |
| useIntersectionObserver | 检测目标元素的可见性。                  | [use-intersection-observer.md](../composables/use-intersection-observer.md) |
| useMouseInElement       | 响应式鼠标位置相对于元素                | [use-mouse-in-element.md](../composables/use-mouse-in-element.md)           |
| useMutationObserver     | 观察 DOM 树的变化。MutationObs... | [use-mutation-observer.md](../composables/use-mutation-observer.md)         |
| useParentElement        | 获取给定元素的父元素                      | [use-parent-element.md](../composables/use-parent-element.md)               |
| useResizeObserver       | 报告元素内容维度的变化... | [use-resize-observer.md](../composables/use-resize-observer.md)             |
| useWindowFocus          | 响应式追踪窗口焦点和事件。               | [use-window-focus.md](../composables/use-window-focus.md)                   |
| useWindowScroll         | 响应式窗口滚动                                       | [use-window-scroll.md](../composables/use-window-scroll.md)                 |
| useWindowSize           | 响应式窗口大小                                         | [use-window-size.md](../composables/use-window-size.md)                     |

## Network

| 组合式函数     | 描述                                                  | 文件                                                      |
| -------------- | ------------------------------------------------------------ | --------------------------------------------------------- |
| useEventSource | 一个 EventSource 或 Server-Sent-Events 实例打开一个... | [use-event-source.md](../composables/use-event-source.md) |
| useFetch       | 响应式的 Fetch API 提供了中止请求的能力... | [use-fetch.md](../composables/use-fetch.md)               |
| useWebSocket   | 响应式的 WebSocket 客户端。                                   | [use-web-socket.md](../composables/use-web-socket.md)     |

## Reactivity

| 组合式函数          | 描述                                                  | 文件                                                                |
| ------------------- | ------------------------------------------------------------ | ------------------------------------------------------------------- |
| computedAsync       | 异步函数的计算属性                                 | [computed-async.md](../composables/computed-async.md)               |
| computedEager       | 不延迟求值的计算属性。                      | [computed-eager.md](../composables/computed-eager.md)               |
| computedWithControl | 明确定义计算属性的依赖。              | [computed-with-control.md](../composables/computed-with-control.md) |
| createRef           | 返回一个或依赖于参数的 ref。                         | [create-ref.md](../composables/create-ref.md)                       |
| extendRef           | 向 Ref 添加额外属性。                                 | [extend-ref.md](../composables/extend-ref.md)                       |
| reactify            | 将普通函数转换为响应式函数。The con... | [reactify.md](../composables/reactify.md)                           |
| reactifyObject      | 应用于对象                                           | [reactify-object.md](../composables/reactify-object.md)             |
| reactiveComputed    | 响应式计算对象。返回一个 ref 而不是... | [reactive-computed.md](../composables/reactive-computed.md)         |
| reactiveOmit        | 从响应式对象中反应式排除字段。               | [reactive-omit.md](../composables/reactive-omit.md)                 |
| reactivePick        | 从响应式对象中反应式选取字段。               | [reactive-pick.md](../composables/reactive-pick.md)                 |
| refAutoReset        | 一个 ref，在某些时间后会重置为默认值... | [ref-auto-reset.md](../composables/ref-auto-reset.md)               |
| refDebounced        | 防抖执行一个 ref 值。                           | [ref-debounced.md](../composables/ref-debounced.md)                 |
| refDefault          | 为一个 ref 应用默认值。                                | [ref-default.md](../composables/ref-default.md)                     |
| refManualReset      | 创建一个带有手动重置功能的 ref。                | [ref-manual-reset.md](../composables/ref-manual-reset.md)           |
| refThrottled        | 节流更改一个 ref 的值。                            | [ref-throttled.md](../composables/ref-throttled.md)                 |
| refWithControl      | 对 ref 及其响应性的细粒度控制。           | [ref-with-control.md](../composables/ref-with-control.md)           |
| syncRef             | 双向 ref 同步。                                | [sync-ref.md](../composables/sync-ref.md)                           |
| syncRefs            | 保持目标 ref 与源 ref 同步                   | [sync-refs.md](../composables/sync-refs.md)                         |
| toReactive          | 将 ref 转换为响应式。也使得创建一个... | [to-reactive.md](../composables/to-reactive.md)                     |
| toRef               | 标准化值/ref/getter 到或 。                           | [to-ref.md](../composables/to-ref.md)                               |
| toRefs              | 扩展，还接受对象的 ref。                | [to-refs.md](../composables/to-refs.md)                             |

## Sensors

| 组合式函数           | 描述                                                  | 文件                                                                  |
| -------------------- | ------------------------------------------------------------ | --------------------------------------------------------------------- |
| onClickOutside       | 监听元素外部的点击。对于模态框等很有用... | [on-click-outside.md](../composables/on-click-outside.md)             |
| onElementRemoval     | 当元素或包含它的任何元素被移除时触发。 | [on-element-removal.md](../composables/on-element-removal.md)         |
| onKeyStroke          | 监听键盘按键。                              | [on-key-stroke.md](../composables/on-key-stroke.md)                   |
| onLongPress          | 监听元素上的长按。                       | [on-long-press.md](../composables/on-long-press.md)                   |
| onStartTyping        | 当用户在不可编辑元素上开始输入时触发。      | [on-start-typing.md](../composables/on-start-typing.md)               |
| useBattery           | 响应式的电池状态 API，通常称为... | [use-battery.md](../composables/use-battery.md)                       |
| useDeviceMotion      | 响应式的 DeviceMotionEvent。为 Web 开发者提供... | [use-device-motion.md](../composables/use-device-motion.md)           |
| useDeviceOrientation | 响应式的 DeviceOrientationEvent。为 Web 开发者提供... | [use-device-orientation.md](../composables/use-device-orientation.md) |
| useDevicePixelRatio  | 响应式追踪                                             | [use-device-pixel-ratio.md](../composables/use-device-pixel-ratio.md) |
| useDevicesList       | 响应式的 enumerateDevices 列出可用的输入/输出设备... | [use-devices-list.md](../composables/use-devices-list.md)             |
| useDisplayMedia      | 响应式的流媒体。                                          | [use-display-media.md](../composables/use-display-media.md)           |
| useElementByPoint    | 响应式的元素由点决定。                                   | [use-element-by-point.md](../composables/use-element-by-point.md)     |
| useElementHover      | 响应式的元素悬停状态。                              | [use-element-hover.md](../composables/use-element-hover.md)           |
| useFocus             | 响应式的工具，用于追踪或设置 DOM 元素的焦点状态... | [use-focus.md](../composables/use-focus.md)                           |
| useFocusWithin       | 响应式的工具，用于追踪元素或其后代是否具有焦点... | [use-focus-within.md](../composables/use-focus-within.md)             |
| useFps               | 响应式的 FPS（每秒帧数）。                            | [use-fps.md](../composables/use-fps.md)                               |
| useGeolocation       | 响应式的地理定位 API。允许用户提供... | [use-geolocation.md](../composables/use-geolocation.md)               |
| useIdle              | 跟踪用户是否处于非活动状态。                   | [use-idle.md](../composables/use-idle.md)                             |
| useInfiniteScroll    | 元素的无限滚动。                           | [use-infinite-scroll.md](../composables/use-infinite-scroll.md)       |
| useKeyModifier       | 响应式的修饰键状态。追踪任何支持的修饰键状态... | [use-key-modifier.md](../composables/use-key-modifier.md)             |
| useMagicKeys         | 响应式的按键按下状态，带有神奇的键组合... | [use-magic-keys.md](../composables/use-magic-keys.md)                 |
| useMouse             | 响应式的鼠标位置                                      | [use-mouse.md](../composables/use-mouse.md)                           |
| useMousePressed      | 响应式的鼠标按下状态。由 on target element 触发... | [use-mouse-pressed.md](../composables/use-mouse-pressed.md)           |
| useNavigatorLanguage | 响应式的 navigator.language。                                 | [use-navigator-language.md](../composables/use-navigator-language.md) |
| useNetwork           | 响应式的网络状态。网络信息 API 提供... | [use-network.md](../composables/use-network.md)                       |
| useOnline            | 响应式的在线状态。. 的包装器。                        | [use-online.md](../composables/use-online.md)                         |
| usePageLeave         | 响应式的页面离开状态。显示鼠标是否离开了页面。    | [use-page-leave.md](../composables/use-page-leave.md)                 |
| useParallax          | 轻松创建视差效果。它使用和回退到 if... | [use-parallax.md](../composables/use-parallax.md)                     |
| usePointer           | 响应式的指针状态。                                      | [use-pointer.md](../composables/use-pointer.md)                       |
| usePointerLock       | 响应式的指针锁定。                                       | [use-pointer-lock.md](../composables/use-pointer-lock.md)             |
| usePointerSwipe      | 基于 PointerEvents 的响应式滑动检测。             | [use-pointer-swipe.md](../composables/use-pointer-swipe.md)           |
| useScroll            | 响应式的滚动位置和状态。                          | [use-scroll.md](../composables/use-scroll.md)                         |
| useScrollLock        | 锁定元素的滚动。                               | [use-scroll-lock.md](../composables/use-scroll-lock.md)               |
| useSpeechRecognition | 响应式的 SpeechRecognition。                                  | [use-speech-recognition.md](../composables/use-speech-recognition.md) |
| useSpeechSynthesis   | 响应式的 SpeechSynthesis。                                    | [use-speech-synthesis.md](../composables/use-speech-synthesis.md)     |
| useSwipe             | 基于 . 的响应式滑动检测。                          | [use-swipe.md](../composables/use-swipe.md)                           |
| useTextSelection     | 基于 . 的响应式用户文本选择追踪。              | [use-text-selection.md](../composables/use-text-selection.md)         |
| useUserMedia         | 响应式的流媒体。                                          | [use-user-media.md](../composables/use-user-media.md)                 |

## State

| 组合式函数             | 描述                                                  | 文件                                                                        |
| ---------------------- | ------------------------------------------------------------ | --------------------------------------------------------------------------- |
| createGlobalState      | 在全局作用域中保持状态，以便在 Vue 应用之间重用... | [create-global-state.md](../composables/create-global-state.md)             |
| createInjectionState   | 创建一个可以注入到组件中的全局状态。    | [create-injection-state.md](../composables/create-injection-state.md)       |
| createSharedComposable | 使组合式函数可在多个 Vue 实例中使用... | [create-shared-composable.md](../composables/create-shared-composable.md)   |
| injectLocal            | 扩展，具有调用的能力以提供在... | [inject-local.md](../composables/inject-local.md)                           |
| provideLocal           | 扩展，具有调用的能力以获取在... | [provide-local.md](../composables/provide-local.md)                         |
| useAsyncState          | 响应式的异步状态。不会阻塞设置函数... | [use-async-state.md](../composables/use-async-state.md)                     |
| useDebouncedRefHistory | 带防抖过滤器的简写。                         | [use-debounced-ref-history.md](../composables/use-debounced-ref-history.md) |
| useLastChanged         | 记录最后更改的时间戳                     | [use-last-changed.md](../composables/use-last-changed.md)                   |
| useLocalStorage        | 响应式的本地存储。                                       | [use-local-storage.md](../composables/use-local-storage.md)                 |
| useManualRefHistory    | 手动跟踪 ref 的更改历史，当使用... | [use-manual-ref-history.md](../composables/use-manual-ref-history.md)       |
| useRefHistory          | 跟踪 ref 的更改历史，也提供撤销和... | [use-ref-history.md](../composables/use-ref-history.md)                     |
| useSessionStorage      | 响应式的会话存储。                                     | [use-session-storage.md](../composables/use-session-storage.md)             |
| useStorage             | 创建一个可用来访问和修改... | [use-storage.md](../composables/use-storage.md)                             |
| useStorageAsync        | 支持异步的响应式存储。                      | [use-storage-async.md](../composables/use-storage-async.md)                 |
| useThrottledRefHistory | 带节流过滤器的简写。                         | [use-throttled-ref-history.md](../composables/use-throttled-ref-history.md) |

## Time

| 组合式函数     | 描述                                                  | 文件                                                        |
| -------------- | ------------------------------------------------------------ | ----------------------------------------------------------- |
| useCountdown   | 提供倒计时功能的包装器。                 | [use-countdown.md](../composables/use-countdown.md)         |
| useDateFormat  | 根据字符串标记获取格式化的日期... | [use-date-format.md](../composables/use-date-format.md)     |
| useTimeAgo     | 响应式的 ago 时间。自动更新 ago 字符串... | [use-time-ago.md](../composables/use-time-ago.md)           |
| useTimeAgoIntl | 带 i18n 支持的 ago 时间。自动更新... | [use-time-ago-intl.md](../composables/use-time-ago-intl.md) |

## Utilities

| 组合式函数          | 描述                                                  | 文件                                                                |
| ------------------- | ------------------------------------------------------------ | ------------------------------------------------------------------- |
| createEventHook     | 用于创建事件钩子的工具                             | [create-event-hook.md](../composables/create-event-hook.md)         |
| createUnrefFn       | 使一个普通函数接受 ref 和原始值作为参数... | [create-unref-fn.md](../composables/create-unref-fn.md)             |
| get                 | 访问的简写                                      | [get.md](../composables/get.md)                                     |
| isDefined           | 非空检查类型保护。                     | [is-defined.md](../composables/is-defined.md)                       |
| makeDestructurable  | 为对象和数组创建同构可解构。... | [make-destructurable.md](../composables/make-destructurable.md)     |
| set                 | 的简写                                                | [set.md](../composables/set.md)                                     |
| useAsyncQueue       | 顺序执行每个异步任务并将其传递给... | [use-async-queue.md](../composables/use-async-queue.md)             |
| useBase64           | 响应式的 base64 转换。支持纯文本、缓冲区... | [use-base64.md](../composables/use-base64.md)                       |
| useCached           | 使用自定义比较器缓存一个 ref。                        | [use-cached.md](../composables/use-cached.md)                       |
| useCloned           | 响应式的 ref 克隆。默认使用 to do 克隆。 | [use-cloned.md](../composables/use-cloned.md)                       |
| useConfirmDialog    | 创建事件钩子以支持模态框和确认对话... | [use-confirm-dialog.md](../composables/use-confirm-dialog.md)       |
| useCounter          | 基础计数器，带有实用函数。                        | [use-counter.md](../composables/use-counter.md)                     |
| useCycleList        | 在项目列表之间循环。                               | [use-cycle-list.md](../composables/use-cycle-list.md)               |
| useDebounceFn       | 防抖执行一个函数。                            | [use-debounce-fn.md](../composables/use-debounce-fn.md)             |
| useEventBus         | 一个基础的事件总线。                                           | [use-event-bus.md](../composables/use-event-bus.md)                 |
| useMemoize          | 根据参数和键缓存函数的结果... | [use-memoize.md](../composables/use-memoize.md)                     |
| useOffsetPagination | 响应式的偏移分页。                                  | [use-offset-pagination.md](../composables/use-offset-pagination.md) |
| usePrevious         | 保持一个 ref 的前一个值。                           | [use-previous.md](../composables/use-previous.md)                   |
| useStepper          | 提供构建多步骤向导界面的辅助工具。 | [use-stepper.md](../composables/use-stepper.md)                     |
| useSupported        | SSR 兼容                                            | [use-supported.md](../composables/use-supported.md)                 |
| useThrottleFn       | 节流执行一个函数。特别是对于 r... | [use-throttle-fn.md](../composables/use-throttle-fn.md)             |
| useTimeoutPoll      | 使用超时轮询某项内容。它将触发回调... | [use-timeout-poll.md](../composables/use-timeout-poll.md)           |
| useToggle           | 布尔开关器，带有实用函数。                   | [use-toggle.md](../composables/use-toggle.md)                       |
| useToNumber         | 响应式地将字符串 ref 转换为数字。                   | [use-to-number.md](../composables/use-to-number.md)                 |
| useToString         | 响应式地将 ref 转换为字符串。                          | [use-to-string.md](../composables/use-to-string.md)                 |

## Watch

| 组合式函数       | 描述                                                  | 文件                                                        |
| ---------------- | ------------------------------------------------------------ | ----------------------------------------------------------- |
| until            | 一次性 watch 变化                                          | [until.md](../composables/until.md)                         |
| watchArray       | 监听数组的添加和删除。              | [watch-array.md](../composables/watch-array.md)             |
| watchAtMost      | 具有触发次数限制的 watch。                          | [watch-at-most.md](../composables/watch-at-most.md)         |
| watchDebounced   | 防抖的 watch                                              | [watch-debounced.md](../composables/watch-debounced.md)     |
| watchDeep        | 深度监听值的简写                            | [watch-deep.md](../composables/watch-deep.md)               |
| watchIgnorable   | 可忽略的 watch                                              | [watch-ignorable.md](../composables/watch-ignorable.md)     |
| watchImmediate   | 即时监听值的简写                            | [watch-immediate.md](../composables/watch-immediate.md)     |
| watchOnce        | 一次性监听值的简写。一旦回调首次触发... | [watch-once.md](../composables/watch-once.md)               |
| watchPausable    | 可暂停的 watch                                               | [watch-pausable.md](../composables/watch-pausable.md)       |
| watchThrottled   | 节流的 watch。                                             | [watch-throttled.md](../composables/watch-throttled.md)     |
| watchTriggerable | 可手动触发的 watch                         | [watch-triggerable.md](../composables/watch-triggerable.md) |
| watchWithFilter  | 带额外 EventFilter 控制的 watch。                         | [watch-with-filter.md](../composables/watch-with-filter.md) |
| whenever         | 一个简写，监听值为真。                   | [whenever.md](../composables/whenever.md)                   |
