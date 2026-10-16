# tern-kami

A warm-paper theme for [Tern](https://stencil.so/tern), inspired by [Kami](https://kami.tw93.fun/) by Tw93.

暖纸底色、墨蓝强调色、衬线字体。将 Kami 的纸面风格带进 Tern。

![Kami theme rendered in Tern: bilingual prose, syntax highlighting, and status badges](assets/preview.png)

Native Tern rendering with synthetic demonstration content, not a live agent conversation.
截图由 Tern 原生渲染，内容为排版演示，不是真实会话。

## Install / 安装

```sh
tern plugin install https://github.com/justdoswift/tern-kami
```

The theme applies when the plugin loads. It is a **plugin**, not an entry in Tern's built-in theme picker. If a window has not refreshed, run `tern plugin reload` or reopen it. Requires Tern's window-plugin and CSS APIs; verified on **Tern 0.8.4, macOS**. Windows, Linux, and iOS have not been tested.

安装后随插件加载生效。这是**主题插件**，不是内置主题列表中的一个选项。窗口未刷新时，运行 `tern plugin reload` 或重新打开窗口。已在 **macOS / Tern 0.8.4** 验证；Windows、Linux、iOS 尚未验证。

For a local checkout / 本地开发：

```sh
git clone https://github.com/justdoswift/tern-kami
tern plugin link ./tern-kami
```

## Typography / 字体

| Surface / 位置 | Font / 字体 |
| --- | --- |
| Interface and Latin prose / 界面与西文正文 | Charter → Georgia → serif |
| Chinese prose / 中文正文 | TsangerJinKai02（仓耳今楷 02）→ Source Han / Noto Serif → Songti SC |
| Monospace fallback / 等宽后备字体 | JetBrains Mono → Fira Code → system monospace |

Install the fonts locally, then restart Tern. Charter ships with macOS. Get 仓耳今楷 from [Tsanger](https://tsanger.cn/) and [JetBrains Mono from JetBrains](https://www.jetbrains.com/lp/mono/); follow each font's own license. Font binaries are not distributed by this repository. Missing fonts fall back through the stacks above.

先在系统中安装字体，再重启 Tern。macOS 自带 Charter；仓耳今楷请从[仓耳字库](https://tsanger.cn/)获取，JetBrains Mono 请从[官网](https://www.jetbrains.com/lp/mono/)获取，并遵守各自的字体授权。仓库不分发字体文件；缺失字体时使用上表中的后备字体。

**Terminal grid and code:** Tern measures terminal cells from its **Font** preference. This plugin does not override `--tv-font` or rewrite that preference. To match the screenshot, set **Font** and **Code font** to `JetBrains Mono` in Tern's settings. Keep a monospace face for these fields; never use Charter or 仓耳今楷 as the terminal grid font.

**终端与代码：** Tern 根据 **Font** 设置计算字符网格。插件不覆盖 `--tv-font`，也不改写你的字体设置。要获得截图中的效果，在 Tern 设置中把 **Font** 和 **Code font** 设为 `JetBrains Mono`。这两个位置应使用等宽字体，不要把 Charter 或仓耳今楷用于终端网格。

Tern currently parses but ignores CSS `@font-face`, so bundling a webfont would not install it. [Native CSS support](https://docs.stencil.so/tern/styles/css.html#font-face).

Tern 目前会解析但忽略 CSS `@font-face`，插件无法通过网页字体自动安装字体。

## Palette / 配色

| Token / 用途 | Color |
| --- | --- |
| Paper / 暖纸 | `#f5f4ed` |
| Ivory / 象牙白 | `#faf9f5` |
| Sand / 细线与衬底 | `#e8e6dc` |
| Code / 代码背景 | `#f0eee6` |
| Ink / 正文 | `#141413` |
| Blue / 墨蓝 | `#1b365d` |
| Secondary blue / 次级蓝 | `#2d5a8a` |
| Muted / 次要文字 | `#6b6a64` |

The core colors and font stacks come from [Kami's stylesheet](https://kami.tw93.fun/styles.css). Functional success, warning, error, activity, and 16 ANSI colors extend that palette for terminal use. Inline RGB/true-color output and a program's own palette can still choose their own colors.

基础颜色和字体栈取自 [Kami 样式表](https://kami.tw93.fun/styles.css)；另补充终端所需的成功、警告、错误、运行中状态和 16 色 ANSI 调色板。程序直接输出的 RGB 真彩色或自定义调色板仍由程序决定。

## Behavior / 使用边界

- **Light only.** Kami stays paper-colored even when the system appearance is dark. Disable it before using another theme.
- Styles native Tern chrome, Markdown surfaces, theme-driven code colors, and terminal ANSI colors. It does not inject CSS into browser blocks or websites.
- Installed on the local window side only. Installing it on a remote SSH host does not theme connected clients. Tern's Web client does not execute window plugins.
- No dependencies, network requests, shell commands, timers, or preference writes. The entry reads `kami.css` and installs one stylesheet.
- Existing layout, keyboard shortcuts, terminal font size, focus behavior, and program colors remain under Tern's control. Avoid enabling multiple global theme plugins together.

- **仅浅色。** 系统为深色时也保持纸面配色；切换其他主题前请停用本插件。
- 覆盖原生界面、Markdown、跟随主题的代码高亮及终端 ANSI 配色；不向浏览器面板或网页注入样式。
- 只在本机窗口端生效。安装到远程 SSH 主机不会改变连接客户端的主题；Tern Web 客户端不运行窗口插件。
- 零依赖；不联网、不执行命令、不设定时器、不改写偏好设置。入口只读取 `kami.css` 并注册一个样式表。
- 保留 Tern 的布局、快捷键、终端字号、焦点行为及程序自定义颜色。请勿同时启用多个全局主题插件。

## Disable, remove, update / 停用、卸载、更新

Turn off **Kami** in **Settings → Plugins** to return to your saved Tern theme. To remove an installed copy:

在 **Settings → Plugins** 关闭 **Kami** 即可恢复原有主题。卸载安装副本：

```sh
tern plugin remove tern-kami
```

For a linked checkout, unlink instead; the source directory is kept / 本地链接使用 unlink，不删除源码目录：

```sh
tern plugin unlink tern-kami
```

Update an installed copy / 更新安装副本：

```sh
tern plugin install https://github.com/justdoswift/tern-kami --force
```

`--force` does not replace a linked checkout. Update that checkout yourself, then run `tern plugin reload`.

`--force` 不覆盖本地链接。请自行更新源码，再运行 `tern plugin reload`。

## Development / 开发

Edit `kami.css`, then reload with `tern plugin reload`. `window.luau` installs it as `plugin:local:tern-kami:theme`; Tern removes the sheet when the plugin unloads. No build step is needed.

修改 `kami.css` 后运行 `tern plugin reload`。样式表名为 `plugin:local:tern-kami:theme`，卸载插件时由 Tern 移除，无需构建。

Use a separate `TERN_CONFIG_DIR` and `TERN_DAEMON_SOCKET` for testing. Native plugin loading requires an ordinary Tern window: `tern serve` deliberately skips user plugins. A headless CSS preview can load the file with `tern ctl --control SOCKET css kami /absolute/path/to/kami.css`.

测试时使用独立的 `TERN_CONFIG_DIR` 与 `TERN_DAEMON_SOCKET`。真实插件加载应通过普通 Tern 窗口验证，`tern serve` 有意不加载用户插件；无窗口样式预览可通过上述 `tern ctl … css` 命令加载样式表。

## Credits & license / 致谢与许可

[MIT](LICENSE). Independent community theme; not an official Kami or Tern product. Kami's palette and font-stack attribution is retained in the license. Fonts remain under their respective licenses.

采用 [MIT](LICENSE) 开源协议。独立社区主题，非 Kami 或 Tern 官方产品；保留 Kami 配色及字体栈的署名。字体各自的授权不受本仓库 MIT 协议替代。
