---
title: Logstash 调研
date: 2020-07-13 16:27:44
tags: [ELK]
---

最近在网络流量分析项目中需要对日志进行收集和处理，而网络上关于 Logstash 的资料都比较分散，因此本文对 Logstash 的架构与用法进行了简单地梳理，帮助初学者快速入门。

<!-- more -->


## 简介

Logstash 是开源的服务器端数据处理管道，能够同时从多个来源采集数据，处理数据和转发数据。

## 工作流程

数据输入 > 数据过滤 > 数据输出

## 关键组件

Logstash 使用 input，filter，output 三个组件分别完成数据采集、处理和转发的工作。

<b>input 组件负责采集数据各种格式、大小和来源的数据。</b>input 组件能够以连续流式传输的方式，轻松地从日志、指标、Web 应用、数据存储以及各种 AWS 服务采集数据。

<b>filter 插件负责动态地转换和解析数据，不受格式或复杂度的影响。</b>Grok 插件可以帮助开发者方便地从非结构化数据中解析出结构化数据。

<b>output 插件负责转发 filter 处理过的数据到指定的数据库中。</b>Logstash 提供了众多的输出选择，开发者可以将数据发送到指定的地方。例如，可以用 elasticsearch 插件输出到 es ，rediss 插件输出到 redis，stdout 插件标准输出，kafka 插件输出到 kafka 等。

此外，Logstash 具有高度的可扩展性，开发者可以根据自身需要定制插件。

## Grok

Grok 是 Logstash 最重要的插件之一，使用正则表达式对数据完成过滤和解析工作。

参考资料：[Logstash Grok 插件语法介绍 ](https://blog.csdn.net/qq_34021712/article/details/79746413)

## Filebeat

Filebeat 是用来替代 Logstash Forwarder 的下一代 Logstash 收集器，与 Logstash 相比更加轻量和高效，它可以很方便地与 Logstash 或 Elasticsearch 进行对接。

<b>Filebeat 与 Logstash 的联系与区别：</b>

<b > 联系：</b>Filebeat 和 Logstash 都具有日志收集的功能

<b > 区别：</b>Filebeat 更轻量，占用资源较 Logstash 更少。Logstash 具备过滤和处理数据的功能，但 Filebeat 只能采集日志。

在实际使用中，通常使用 Filebeat 作为数据收集的工具，接着使用 Redis/ Kafka / RabbitMQ 等缓存数据，最后将数据输出到 Logstash 完成数据聚合、处理的工作。

