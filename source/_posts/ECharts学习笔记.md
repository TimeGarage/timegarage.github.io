---

title: ECharts 学习笔记

date: 2020-12-03 10:17:26

tags: [可视化]

---

本文旨在对数据可视化框架 ECharts 的文档进行梳理，同时结合网络流量分析项目给出自己的思考。

<!-- more -->

## 使用流程

### 导入 ECharts

使用 ECharts 之前，需要将 ECharts 框架导入到工程项目中。ECharts 支持使用标签的方式导入 (`<script src="echarts.min.js">`)，同时也支持用户使用 npm 获取 echarts。如果你的项目正在使用 Vue、React 等工程化框架，那么推荐使用 npm 作为导入 ECharts 的方式。

### 创建图表实例

ECharts 图表实例的创建流程如下：

```mermaid
graph LR
A (创建具备宽高的 DOM) --> B (初始化 ECharts 实例) 
B --> C (设置图表配置项) 
C --> D (设置展示数据)
```

ECharts 提供了 setOption () 函数来更新图形，每当该函数被调用时，ECharts 会比较前后两次数据的差异，并使用合适的动画来呈现图形的变化。实际上，如果只是创建简单的图形，只需要根据需求修改对应的配置项即可。ECharts 所有的配置项可以参考 [ECharts 文档 - 配置项](https://echarts.apache.org/zh/option.html#title)。

## 交互逻辑

### 自定义 Toolbox

ECharts 自带了 toolbox 帮助用户实现各种简单的交互逻辑：

- saveAsImage => 保存图片
- restore => 配置项还原
- dataView => 数据视图工具
- dataZoom => 数据区域缩放
- magicType => 动态类型切换
- brush 选择组件的控制按钮

除此之外，用户也可根据自己的需要添加 toolbox 按钮和对应的 click 响应事件。需要注意的是，添加到 toolbox 中的自定义 feature 均需要以 my 开头。

### 事件与行为

在网络流量分析项目中，对 brush 选框交互有着独特的需求。例如，需要限定用户最多只能刷选两次，每次的刷选框需要用不同的颜色标记，同时要在刷选框上方给出区间提示等。对于这种自定义的复杂交互逻辑，需要使用 ECharts 提供的 events 和 actions 接口解决。

#### 事件

ECharts 主要通过 on 方法添加事件处理函数，所有的 ECharts 事件列表参考 [ECharts 文档 - events](https://echarts.apache.org/zh/api.html#events)。

ECharts 中的事件主要有两种，一种是鼠标事件（如鼠标单击、双击和悬浮等），一种是使用交互组件（如 datazoom 组件和 brush 组件）后触发的事件。鼠标事件可参考 [ECharts 文档 - 鼠标事件](https://echarts.apache.org/zh/api.html#events)，在此不再赘述。本文研究的重点是 brush 组件的交互事件，因此会对这部分内容进行详细的介绍。

brush 组件是选框组件，适用于用户想要选择一段时间范围的情况。brush 组件有三个重要的交互事件，分别是 brush、brushEnd 和 brushselected 事件。

- brush => 选框正在添加事件
- brushEnd => 选框添加完毕事件
- brushselected => 对外通知当前选择区域事件

默认情况下，刷选或移动选区时，会不断触发 brushSeleted 事件，这可能会导致页面性能问题。好在 ECharts 提供了防抖和节流的配置选项 throttleDelay，用户可以根据自身需要设置触发阈值。

#### 行为

除了用户的交互操作，在程序里调用方法触发图表的行为即为 action。在 ECharts 3 中通过调用 myChart.dispatchAction ({ type: '' }) 触发图表行为。和 brush 组件相关的 action 的使用方法可以参考 [ECharts 文档 - action.brush](https://echarts.apache.org/zh/api.html#action.brush)。

- action.brush.brush => 刷选动作进行中触发，可设置或删除 chart 中的选框。
- action.brush.brushEnd => 刷选动作完毕时自动触发该 action。
- action.brush.takeGlobalCursor => 将鼠标变更为可刷选状态。