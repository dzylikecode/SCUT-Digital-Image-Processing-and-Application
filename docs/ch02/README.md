# 数字图像处理的基础

## 人类的视觉感知系统

Visual System of Human Beings

人类感知只限于电磁波谱的视觉波段, 成像机器则可以覆盖几乎全部电磁波谱

### 基本构造

Visual system. (2022, September 6). In Wikipedia. https://en.wikipedia.org/wiki/Visual_system

<img src="https://upload.wikimedia.org/wikipedia/commons/1/1e/Schematic_diagram_of_the_human_eye_en.svg" style="background:#E1EFD9">

- 虹膜

收缩和扩张控制进入眼内的光量

- 视网膜

  外部光在视网膜上聚焦成像

  由光接收器的相应刺激产生感觉. 感觉把辐射能转化为电脉冲，最后由大脑解码

- 大脑

  1. 存储参考图象
  2. 信息处理
  3. 特征提取
  4. 决策
  5. 描述

- 马赫带效应

- optical illusions

  google for it: [optical illusions](https://www.google.com/search?q=optical+illusions&oq=optical+illusions&aqs=chrome..69i57.258j0j7&sourceid=chrome&ie=UTF-8#imgrc=BDAm7Pv5UM6I6M)

  > 人的主观, Images may be subject. 人的亮度是主观的

## 数字图像的基础知识

- 数学表达

  任一幅图像，根据它的光强度 $I$ (亮度、密度或灰度)的空间分布

  $$I = f ( x , y , z , \lambda , t )$$

- 矩阵形式

  $$
  I=I[x, y]=\left[\begin{array}{cccc}
  i_{0,0} & i_{0,1} & \cdots & i_{0, N-1} \\
  i_{1,0} & i_{1,1} & \cdots & i_{1, N-1} \\
  \vdots & \vdots & \vdots & \vdots \\
  i_{M-1,0} & i_{M-1,1} & \cdots & i_{M-1, N-1}
  \end{array}\right]
  $$

### 图像的获取

- 过程

  扫描, 采样和量化

- 设备的组成

  采样孔, 扫描机构, 光传感器, 量化器和输出存储体

- 关键技术

  采样 -> 成像技术

  量化 -> 模数转换技术

- 采样

  采样间隔越大, 所得图像像素数越少, 空间分辨率低 -> 马赛克效应

- 量化

  量化等级越少, 图像层次欠丰富, 灰度分辨率低, 会出现假轮廓现象, 但数据量小

### 像素间的基本关系

- 邻域

  - 4-邻域

    $$N_4(p)$$

  - 8-邻域

    $$N_8(p)$$

  > 物理位置相邻

- 邻接定义

  p 和 q 邻接需要满足:

  - p 和 q 位置相邻

    $$
    \begin{cases}
    (x_q, y_q) \in N(p) \\
    (x_p, y_p) \in N(q)
    \end{cases}
    $$

  - p 和 q 的灰度值相近

    设灰度值相近(似)准则为$V=\left\{ v_1, v_2, \cdots, v_n \right\}$, 满足

    $$
    \begin{cases}
    v_q \in V \\
    v_p \in V
    \end{cases}
    $$

- 邻接分类

  - 4-邻接
  - 8-邻接
  - m-邻接(混合邻接)

    消除 8 邻接的二义性

    > 实质:同时存在 4-邻接和 8-邻接时, 优先采用 4-邻接

    - example

      |           8-邻接           |            混合邻接            |
      | :------------------------: | :----------------------------: |
      | ![](assets/8-neighbor.svg) | ![](assets/mixed-neighbor.svg) |

      > 可以看到 8-邻接会产生二义性, 出现了环, 而 m-邻接采用优先 4-邻接的策略, 消除了二义性

- 连通性

  若两个具有相同性质的能够找到两两连接的一条通路

  > 通路: 两个像素邻接即形成一个通路

- 通路长度

  最短路径的长度

  > 不连通, 则`通路长度`为无穷大

- 距离

  > 刻画像素在空间的接近程度有关

- 距离的定义

  满足以下性质的$D(q,p)$函数即为距离的度量函数

  - 非负性

    $$D(q,p) \geq 0$$

  - 对称性

    $$D(q,p) = D(p,q)$$

  - 三角不等式

    $$D(q,p) \leq D(q,r) + D(r,p)$$

  > 是描述像素间关系的基本参数, 也是目标物几何特征和相似性的重要`测度`

- 常用的距离函数

  - 欧氏距离

    $$D(q,p) = \sqrt{(x_q - x_p)^2 + (y_q - y_p)^2}$$

  - 曼哈顿距离

    $$D(q,p) = |x_q - x_p| + |y_q - y_p|$$

  - 切比雪夫距离

    $$D(q,p) = max(|x_q - x_p|, |y_q - y_p|)$$

  - 闵可夫斯基距离

    $$D(q,p) = \sqrt[p]{(x_q - x_p)^p + (y_q - y_p)^p}$$

    > 当 p = 2 时, 为欧氏距离

  - 马氏距离

    $$D(q,p) = \sqrt{(q - p)^T \Sigma^{-1} (q - p)}$$

    > $\Sigma$ 为协方差矩阵

  > 不少是 copilot 推导出来的, 有点意外 :smile:
