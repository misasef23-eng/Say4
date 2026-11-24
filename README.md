# 🗣️ Thiết Bị Hỗ Trợ Giao Tiếp 4 Nút Bấm Cho Người Tai Biến (ESP32)

Một chiếc máy phát giọng nói nhỏ gọn (đeo cổ tay như đồng hồ hoặc cầm tay) giúp người bệnh sau tai biến gặp khó khăn trong phát âm có thể **chỉ cần nhấn 1 trong 4 nút màu lớn** để phát ra ngay những câu nói sinh hoạt thiết yếu nhất cho người nhà nghe thấy.

![Bản vẽ tổng quan thiết bị](<tổng quan.png>)

*(Lưu ý hiển thị ảnh: Hãy đặt file ảnh `tổng quan.png` nằm cùng thư mục với file `README.md` này để ảnh tự động hiển thị).*

---

## 🌟 Điểm Nổi Bật Của Thiết Bị

* **Hoạt động hoàn toàn độc lập:** Không cần kết nối điện thoại, không cần Wi-Fi, không cần cắm dây điện trực tiếp và cũng không cần mua thêm thẻ nhớ ngoài.
* **Pin cực bền (7 – 14 ngày mới phải sạc 1 lần):** Nhờ cơ chế tự động "ngủ đông" (Light-sleep) ngay sau khi đọc xong câu nói, mức tiêu thụ điện lúc chờ gần như bằng không. Khi hết pin, chỉ cần cắm dây sạc điện thoại cổng **USB-C** thông thường.
* **Gọn nhẹ, dễ thao tác cho bàn tay yếu:** Kích thước thân vỏ chỉ $74 \times 52 \times 18\text{ mm}$ (bằng một chiếc đồng hồ mặt lớn hoặc hộp quẹt), bố trí 4 nút bấm tròn kích thước lớn ($\varnothing 12\text{ mm}$), phân biệt bằng 4 màu rõ ràng, lực nhấn nhẹ để tránh bấm nhầm.
* **Cực kỳ ít dây hàn:** Chọn sẵn những linh kiện "tất cả trong một" nên người mới hoàn toàn có thể tự làm tại nhà hoặc nhờ thợ sửa điện tử gần nhà hàn giúp trong khoảng 15 phút.

---

## 🧠 Giải Thích Nhanh Nguyên Lý (Dành Cho Người Chưa Biết Điện Tử)

Bên trong chiếc hộp nhỏ này chỉ có **5 thành phần chính**, hoạt động giống như cơ thể người:

1. **Bo mạch XIAO ESP32-C3 ("Bộ não + Bộ nhớ + Cục sạc"):**
   * Lưu sẵn 4 đoạn ghi âm giọng nói (giọng người nhà hoặc giọng đọc AI) ngay bên trong bộ nhớ của nó.
   * Tích hợp sẵn mạch sạc pin qua cổng USB-C nên không cần mua thêm mạch sạc rời.
   * Bình thường nó sẽ "ngủ thiếp đi" để tiết kiệm pin. Ngay khoảnh khắc người bệnh bấm nút, nó thức dậy trong chưa đầy $0.005\text{ giây}$, phát câu nói tương ứng rồi lại tự ngủ tiếp.
2. **Mạch khuếch đại MAX98357A ("Cái âm-ly mini"):**
   * Tín hiệu âm thanh từ bộ não XIAO rất yếu, nếu nối thẳng vào loa sẽ không nghe thấy gì. Mạch MAX98357A đóng vai trò khuếch đại âm thanh lên to rõ để người nhà đứng trong phòng hoặc ngoài phòng khách đều nghe được.
   * Mạch này có 1 chân điều khiển tắt/bật nguồn (`SD`), khi bộ não đi ngủ thì nó cũng tự ngắt điện hoàn toàn ($< 1\,\mu\text{A}$).
3. **Loa mini mỏng ($\varnothing 28\text{ mm}$):** Phát âm thanh ra ngoài qua mặt lưới tròn trên nắp hộp.
4. **Pin sạc LiPo $3.7\text{V}$ ($500\text{ mAh}$):** Nuôi điện cho toàn bộ thiết bị.
5. **4 Công tắc nhấn:** Đặt dưới 4 nắp nút màu Đỏ, Vàng, Xanh lá, Xanh dương.

---

## 🛒 Bước 1: Danh Sách Linh Kiện & Dụng Cụ Cần Mua

Bạn có thể tìm mua toàn bộ linh kiện dưới đây trên Shopee, Lazada hoặc các cửa hàng linh kiện điện tử. **Chú ý đọc kỹ cột "Lưu ý tránh mua nhầm"** để linh kiện lắp vừa khít 100% vào vỏ in 3D.

### A. Linh kiện điện tử & cơ khí

| STT | Tên linh kiện | Số lượng | Từ khóa tìm mua | Lưu ý QUAN TRỌNG tránh mua nhầm |
| :-: | :--- | :-: | :--- | :--- |
| **1** | **Bo mạch Seeed Studio XIAO ESP32-C3** | 1 | `Seeed Studio XIAO ESP32C3` | Mua đúng bản **XIAO ESP32-C3** (hoặc XIAO ESP32-S3) kích thước $21 \times 17.8\text{ mm}$, có cổng USB-C. **Không** mua bản ESP32-C3 SuperMini vì không có sẵn mạch sạc pin và kích thước sẽ không vừa khay vỏ 3D. |
| **2** | **Mạch âm thanh MAX98357A** | 1 | `Module MAX98357A I2S` | Mạch màu tím nhỏ ($19.4 \times 17.8\text{ mm}$). Thường shop gửi kèm 1 cái đầu nối màu xanh (domino) rời — **KHÔNG hàn đầu nối xanh này vào mạch** để giữ độ mỏng. |
| **3** | **Loa mini mỏng $\varnothing 28\text{ mm}$** | 1 | `Loa mini 28mm 8ohm 1W` hoặc `2W` | Chọn đúng loa tròn **đường kính $28\text{ mm}$**, **độ dày $\le 5\text{ mm}$** (thường dùng cho máy nghe nhạc/đồ chơi). Không mua loa $2\text{ inch}$ ($52\text{ mm}$) vì quá to so với vỏ đeo tay. |
| **4** | **Pin sạc LiPo $3.7\text{V}$ dẹt** | 1 | `Pin LiPo 502535` hoặc `602535 500mAh` | Chọn loại hình chữ nhật dẹt kích thước khoảng **$25 \times 35 \times 5\text{--}6\text{ mm}$** ($400\text{--}500\text{ mAh}$). **BẮT BUỘC phải có mạch bảo vệ PCM** (nhìn ở đầu ra dây pin có 1 dải băng keo màu vàng hổ phách bọc bo mạch nhỏ xíu — giúp chống hỏng pin khi cạn điện). |
| **5** | **Nút nhấn vuông $12 \times 12\text{ mm}$** | 4 | `Nút nhấn 4 chân 12x12x5mm` | Chọn đúng loại **cao $5\text{ mm}$** (`12x12x5mm`), ưu tiên loại lực nhấn nhẹ. *(Nếu lỡ mua loại cao $4.3\text{ mm}$ hoặc $6\text{ mm}$, bạn vẫn chỉnh lại được trong file in 3D).* |
| **6** | **Vít nhỏ `M2 x 8 mm`** | 4 | `Vít M2x8 đầu bằng` hoặc `đầu trụ` | Đường kính ren $2\text{ mm}$, dài $8\text{ mm}$ để bắt 4 góc ghép vỏ trên và vỏ dưới. |
| **7** | **Dây đeo đồng hồ bản $22\text{ mm}$** | 1 | `Dây đồng hồ dán nylon 22mm` | Nên chọn **dây vải dán (Velcro)** bản rộng $22\text{ mm}$ để người bệnh hoặc người nhà dễ tháo lắp bằng 1 tay, đeo êm không cấn cổ tay. *(Bỏ qua nếu chỉ muốn cầm tay hoặc đeo cổ).* |

### B. Dụng cụ hỗ trợ lắp ráp

* Mỏ hàn thiếc + cuộn thiếc hàn (nếu chưa có và không quen hàn, bạn có thể mang toàn bộ linh kiện + bảng sơ đồ ở Bước 3 ra tiệm sửa điện thoại/điện tử gần nhà nhờ thợ hàn giúp).
* Dây điện lõi đồng mềm loại rất nhỏ (cỡ `26AWG` hoặc `28AWG`, hoặc tận dụng dây bên trong sợi cáp mạng/cáp USB cũ), nhiều màu để dễ phân biệt.
* Tua-vít 4 cạnh đầu nhỏ (cỡ vặn ốc kính mắt/điện thoại) để vặn ốc `M2`.
* Một ít băng keo 2 mặt mỏng hoặc súng bắn keo nến (để cố định pin và loa không bị xê dịch).
* Dây cáp sạc điện thoại **USB Type-C** (loại có truyền được dữ liệu, để nối máy tính nạp giọng nói và dùng để sạc pin sau này).

---

## 🖨️ Bước 2: In 3D Vỏ Thiết Bị

Dự án đã có sẵn file thiết kế chuẩn xác từng milimet mang tên **`vo_thiet_bi_esp32_xiao.scad`**. File này được tối ưu đặc biệt để **in không cần chân chống đỡ (0% support)**, bề mặt in ra rất đẹp và gọn.

### Cách 1: Tự xuất file `.stl` để mang đi in (chỉ mất 2 phút)

1. Tải và cài đặt phần mềm hoàn toàn miễn phí **OpenSCAD** tại trang chủ `openscad.org`.
2. Mở file `vo_thiet_bi_esp32_xiao.scad` bằng OpenSCAD.
3. Nhìn ở dòng đầu tiên trong file:
   * Nếu bạn mua nút nhấn `12x12` loại cao khác $5.0\text{ mm}$ (ví dụ $6.0\text{ mm}$), hãy sửa đúng 1 con số ở dòng `switch_total_h = 5.0;` thành chiều cao nút bạn mua. Các kích thước khác giữ nguyên.
4. Để xuất file đi in, bạn đổi chữ trong dấu ngoặc kép ở dòng `render_part = ...;`, nhấn phím **F6** (đợi vài giây máy tính dựng hình), rồi vào menu **File $\rightarrow$ Export $\rightarrow$ Export as STL**:
   * Đổi thành `"bottom_shell"` $\rightarrow$ xuất file `vo_duoi.stl` (phần vỏ đáy có 2 tai đeo).
   * Đổi thành `"top_shell"` $\rightarrow$ xuất file `vo_tren.stl` (phần nắp mặt trên có lưới loa — đã tự lật úp sẵn cho máy in).
   * Đổi thành `"single_cap"` $\rightarrow$ xuất file `nap_nut.stl` (1 nắp nút tròn, dặn thợ in **4 chiếc với 4 màu: Đỏ, Vàng, Xanh lá, Xanh dương**).

### Cách 2: Gửi thợ in 3D chuyên nghiệp (Tin nhắn mẫu)

Nếu bạn không có máy in 3D, hãy gửi 3 file `.stl` vừa xuất cho các shop nhận in 3D theo yêu cầu trên Shopee/Facebook kèm đúng nội dung sau:

> *"Nhờ shop in giúp mình 3 file này bằng nhựa **PLA+** (hoặc **PETG**):*
> * *`vo_duoi.stl` và `vo_tren.stl`: in màu xám đậm (hoặc đen).*
> * *`nap_nut.stl`: in 4 cái, chia 4 màu **Đỏ, Vàng, Xanh lá, Xanh dương** (nếu shop không có đủ màu thì in màu trắng để mình về tô/dán decal màu).*
> * ***Thông số in bắt buộc:** Vòi phun $0.4\text{ mm}$, chiều cao lớp (Layer height) đúng **$0.2\text{ mm}$**, 3 lớp tường (3 walls), đặc ruột (Infill) $20\%$, **tắt Support (không cần support)**, giữ nguyên hướng file đã lật sẵn."*

*(Lưu ý nhỏ khi nhận vỏ in về: Bên trong 4 lỗ bắt vít ở đáy `vo_duoi` có 1 lớp màng nhựa siêu mỏng $0.2\text{ mm}$ được cố tình tạo ra để máy in không bị chảy nhựa. Trước khi lắp ốc, bạn chỉ cần lấy mũi tua-vít hoặc chính con vít `M2` chọc nhẹ là thủng ngay).*

---

## 🔌 Bước 3: Nối Dây Mạch Điện (Cầm Tay Chỉ Việc)

### ⚠️ 3 Quy tắc an toàn BẮT BUỘC đọc trước khi hàn

1. **LUÔN HÀN PIN SAU CÙNG:** Chỉ hàn 2 dây pin sau khi đã hàn xong hết nút bấm, loa và mạch MAX98357A. Tránh để 2 đầu dây Đỏ (`+`) và Đen (`-`) của pin chạm vào nhau sẽ gây chập cháy.
2. **KIỂM TRA KỸ CỰC ÂM/DƯƠNG CỦA PIN:** Hai điểm hàn pin tên là `BAT+` và `BAT-` nằm ở **mặt lưng (mặt dưới)** của bo XIAO ESP32-C3. Hàn đúng **Dây Đỏ vào `BAT+`**, **Dây Đen vào `BAT-`**. Hàn ngược sẽ làm hỏng ngay mạch sạc.
3. **KHÔNG HÀN CỌC DOMINO XANH & CHÂN HEADER DÀI:** Nên hàn trực tiếp dây điện mềm vào các lỗ tròn trên bo mạch XIAO và MAX98357A, cắt gọn chân thừa để mạch nằm phẳng gọn trong vỏ mỏng $18\text{ mm}$.

---

### 💡 Mẹo cho người mới về dây `GND` (dây âm/mass chung)

Trong bảng nối dây bên dưới, bạn sẽ thấy rất nhiều chân cùng nối về **`GND`** (gồm: 4 chân của 4 nút nhấn, chân `GND` của MAX98357A, dây đen của Pin). Bạn **không cần** nhồi tất cả 6 sợi dây vào 1 lỗ `GND` nhỏ xíu trên bo XIAO!
Hãy làm như sau: **Hàn nối chuyền** một sợi dây đen đi từ chân 1 của Nút 1 $\rightarrow$ Nút 2 $\rightarrow$ Nút 3 $\rightarrow$ Nút 4 $\rightarrow$ kéo 1 sợi về `GND` của bo XIAO (hoặc xoắn gọn đầu dây lại, hàn thiếc rồi bọc băng keo cách điện).

---

### 📋 Bảng Nối Dây Chi Tiết (Tổng chỉ 4 cụm siêu gọn)

*(Sơ đồ chân này đã được tính toán kỹ để né hoàn toàn các chân khởi động nhạy cảm của chip ESP32-C3, đảm bảo dù người bệnh có lỡ tì tay đè vào nút bấm lúc đang sạc thì máy vẫn không bị treo).*

#### Cụm 1: Nối Loa vào Mạch Âm Thanh MAX98357A (2 dây)
| Từ linh kiện | Hàn vào chân trên MAX98357A | Ghi chú |
| :--- | :--- | :--- |
| Dây Đỏ của Loa $\varnothing 28\text{ mm}$ | Lỗ **`+`** (khu vực loa ra) | Hàn thẳng dây vào lỗ (không gắn cọc xanh) |
| Dây Đen của Loa $\varnothing 28\text{ mm}$ | Lỗ **`-`** (khu vực loa ra) | Dây loa cắt dài khoảng $4\text{--}5\text{ cm}$ là vừa đẹp |

#### Cụm 2: Nối Tín Hiệu Âm Thanh từ MAX98357A sang XIAO ESP32-C3 (4 dây)
| Chân trên MAX98357A | Hàn tới chân trên XIAO ESP32-C3 | Ghi chú |
| :--- | :--- | :--- |
| **`BCLK`** | **`D5`** *(GPIO7)* | Tín hiệu nhịp âm thanh |
| **`LRC`** | **`D6`** *(GPIO21)* | Tín hiệu kênh âm thanh |
| **`DIN`** | **`D7`** *(GPIO20)* | Dữ liệu giọng nói |
| **`SD`** | **`D10`** *(GPIO10)* | Chân ngắt điện loa khi máy ngủ |
| **`GAIN`** | *Để trống (không hàn gì)* | Mặc định âm lượng $9\text{ dB}$ (rõ, không rè). Nếu thử xong muốn to hơn, hàn thêm 1 dây ngắn từ `GAIN` sang `GND` để tăng lên $12\text{ dB}$. |

#### Cụm 3: Nối 4 Nút Nhấn vào XIAO ESP32-C3 (5 dây)
*(Mỗi nút nhấn vuông 4 chân thực chất chỉ là 2 cặp chân thông nhau. Để chắc chắn không hàn nhầm 2 chân đang dính sẵn với nhau, hãy luôn chọn **2 chân nằm chéo góc nhau** của nút nhấn).*

| Nút bấm (từ trên xuống) | Gợi ý câu thoại | 1 chân hàn vào XIAO | Chân chéo góc còn lại |
| :--- | :--- | :--- | :--- |
| **Nút 1 (Màu Đỏ)** | *"Gọi người nhà giúp tôi"* | **`D1`** *(GPIO3)* | Nối chung vào **`GND`** |
| **Nút 2 (Màu Vàng)** | *"Tôi muốn uống nước"* | **`D2`** *(GPIO4)* | Nối chung vào **`GND`** |
| **Nút 3 (Màu Xanh lá)** | *"Tôi đói / muốn ăn cơm"* | **`D3`** *(GPIO5)* | Nối chung vào **`GND`** |
| **Nút 4 (Màu Xanh dương)** | *"Tôi muốn đi vệ sinh"* | **`D4`** *(GPIO6)* | Nối chung vào **`GND`** |

#### Cụm 4: Nối Nguồn Pin LiPo $3.7\text{V}$ (Làm bước này sau cùng!)
| Dây nguồn | Hàn vào đâu? | Lý do kỹ thuật |
| :--- | :--- | :--- |
| **Dây Đỏ (`+`) của Pin** | Hàn vào pad **`BAT+`** (mặt lưng XIAO) **VÀ** chia 1 nhánh hàn vào chân **`VIN`** của MAX98357A | Cấp điện thẳng từ pin ($3.7\text{V}$) giúp loa kêu to khỏe mà không làm sụt nguồn sập bo XIAO. |
| **Dây Đen (`-`) của Pin** | Hàn vào pad **`BAT-`** (mặt lưng XIAO) **VÀ** nối chung vào chân **`GND`** của XIAO & MAX98357A | Hoàn thành vòng điện chung toàn mạch. |

*(Mẹo: Cắt sẵn dây điện dài khoảng $5\text{--}7\text{ cm}$ cho các kết nối giữa vỏ dưới và vỏ trên để khi mở nắp hộp ra sửa chữa hoặc kiểm tra sẽ không bị căng đứt dây).*

---

## 🎙️ Bước 4: Chuẩn Bị 4 File Giọng Nói & Nạp Phần Mềm

Trước khi đóng chặt ốc vít vào hộp, bạn nên cắm cáp USB-C từ bo XIAO vào máy tính để nạp chương trình và thử bấm cả 4 nút xem loa đã kêu to rõ chưa.

### 1. Chuẩn bị 4 câu nói (nên dùng giọng người nhà cho ấm áp, dễ nghe)
* Dùng ứng dụng **Ghi âm** trên điện thoại, thu 4 câu ngắn gọn (mỗi câu khoảng $2\text{--}4\text{ giây}$), nói chậm rãi và rõ chữ trong phòng yên tĩnh:
  1. `cau1.wav`: *"Có ai không, giúp tôi với!"* (Nút Đỏ)
  2. `cau2.wav`: *"Tôi khát, cho tôi uống nước."* (Nút Vàng)
  3. `cau3.wav`: *"Tôi đói, cho tôi ăn cơm."* (Nút Xanh lá)
  4. `cau4.wav`: *"Cho tôi đi vệ sinh."* (Nút Xanh dương)
* **Chuyển đổi định dạng cho nhẹ bộ nhớ:** Lên các trang chuyển đổi âm thanh miễn phí (như `online-audio-converter.com` hoặc dùng phần mềm Audacity), chuyển cả 4 file sang chuẩn:
  * Định dạng: **WAV**
  * Tần số lấy mẫu (Sample rate): **$16000\text{ Hz}$ ($16\text{ kHz}$)**
  * Kênh âm thanh (Channels): **Mono (1 kênh)**
  * Độ sâu bit: **16-bit PCM**
* Với chuẩn này, mỗi câu dài $3\text{ giây}$ chỉ nặng khoảng $96\text{ KB}$. Cả 4 câu chưa tới $400\text{ KB}$, nằm cực kỳ thoải mái trong bộ nhớ $4\text{ MB}$ có sẵn của XIAO ESP32-C3.

### 2. Nạp code & chép file âm thanh
* Phần mềm (Firmware) sẽ sử dụng hệ thống tệp **LittleFS** của Arduino IDE (hoặc PlatformIO) để tải 4 file `cau1.wav` $\rightarrow$ `cau4.wav` thẳng vào bộ nhớ của XIAO ESP32-C3, đồng thời kích hoạt chế độ tự tắt Wi-Fi/Bluetooth và ngủ **Light-sleep**.
* *(Nếu bạn chưa có file code `.ino`, hãy nhắn lại để được xuất bộ code hoàn chỉnh kèm hướng dẫn bấm nút nạp trong Arduino IDE nhé!).*

---

## 🛠️ Bước 5: Lắp Ráp Hoàn Thiện Vào Vỏ In 3D

Khi đã test thử thấy bấm đủ 4 nút đều phát đúng tiếng và không rè, hãy tiến hành xếp linh kiện vào vỏ theo đúng thứ tự trong hình tổng quan:

1. **Lắp vào Vỏ Dưới (`vo_duoi`):**
   * **4 Công tắc $12 \times 12\text{ mm}$:** Đặt vào 4 ô vuông dọc bên trái (bẻ gọn các chân kim loại luồn xuống rãnh trống bên dưới). Chấm 1 giọt nhỏ keo nến ở mép ngoài để công tắc không bị xô lệch.
   * **Bo XIAO ESP32-C3:** Đặt vào khay 2 thanh ray ở góc dưới bên phải sao cho **cổng USB-C hướng thẳng ra khe hở bên hông phải**. Đẩy sát bo chạm vào thành vỏ để khi cắm cáp sạc sẽ có vách nhựa phía sau đỡ lực.
   * **Pin LiPo $3.7\text{V}$:** Dán 1 mẩu băng keo 2 mặt mỏng xuống đáy khoang pin (bên phải, phía trên bo XIAO) rồi đặt viên pin nằm phẳng xuống. Quấn gọn dây pin vào khe trống.
2. **Lắp vào Vỏ Trên (`vo_tren`):**
   * **Loa mỏng $\varnothing 28\text{ mm}$:** Úp mặt màng loa vào vòng tròn định vị ngay sau lưới lỗ tròn, hướng 2 dây loa đi xuống khe dưới về phía MAX98357A. Chấm nhẹ 2 điểm keo nến ở vành nhựa xung quanh loa để giữ chặt (tránh để keo dính vào màng loa).
   * **Mạch MAX98357A:** Đặt vào khay gá góc dưới bên phải trên nắp vỏ trên, cố định nhẹ bằng 1 mẩu băng keo 2 mặt.
   * **4 Nắp nút màu:** Lật ngửa vỏ trên, thả lần lượt 4 nắp nút Đỏ $\rightarrow$ Vàng $\rightarrow$ Xanh lá $\rightarrow$ Xanh dương vào 4 lỗ tròn từ mặt trong ra. Vành rộng bên dưới nắp nút sẽ tự chặn lại không bị rơi ra ngoài.
3. **Đóng vỏ & Hoàn thiện:**
   * Gấp gọn toàn bộ dây điện vào khoảng trống giữa 2 nửa vỏ (kiểm tra kỹ không để dây bị kẹp vào 4 trụ ốc góc hoặc đè lên đỉnh công tắc).
   * Úp vỏ trên vào vỏ dưới cho khớp khít rãnh viền xung quanh.
   * Lật mặt đáy lên, cho **4 con vít `M2 x 8 mm`** vào 4 lỗ góc và vặn vừa chặt tay (đầu vít sẽ chìm hẳn vào trong vỏ để đeo không bị cấn da).
   * Luồn **dây đeo vải dán $22\text{ mm}$** qua 2 khe tai trên và dưới.
   * **Dán nhãn lên 4 nút màu:** In hoặc viết chữ thật to, rõ nét (hoặc dán icon hình ly nước, bát cơm, nhà vệ sinh, cái chuông) lên mặt trên 4 nắp nút rồi phủ 1 lớp băng keo trong để chống mờ do mồ hôi tay.

---

## 🔋 Bước 6: Sử Dụng, Sạc Pin & Xử Lý Sự Cố Thường Gặp

### Cách sạc pin
* Cắm dây sạc điện thoại **USB Type-C** vào khe bên hông phải thiết bị (nên dùng củ sạc $5\text{V}$–$1\text{A}$ thông thường).
* Quan sát ánh sáng đèn báo qua **lỗ LED nhỏ ngay phía trên cổng USB-C**:
  * **Đèn cam/đỏ sáng:** Đang sạc pin.
  * **Đèn tắt hẳn:** Pin đã sạc đầy (mất khoảng $1.5\text{--}2\text{ giờ}$).
* Không cần công tắc tắt/mở nguồn; sau khi sạc đầy chỉ cần rút cáp và đeo lại cho người bệnh dùng bình thường.

### Bảng tự kiểm tra lỗi nhanh (Troubleshooting)

| Hiện tượng gặp phải | Nguyên nhân có thể | Cách khắc phục đơn giản |
| :--- | :--- | :--- |
| **Bấm nút không thấy kêu gì** | Hết pin, hoặc lỏng dây `SD` / dây `GND`, hoặc lắp ngược chân nút bấm. | Thử cắm cáp sạc USB-C vào xem có kêu không. Nếu cắm sạc mà kêu thì kiểm tra lại mối hàn `BAT+`/`BAT-` của pin. |
| **Tiếng nói phát ra hơi nhỏ** | Âm lượng file ghi âm gốc hơi nhỏ, hoặc mức khuếch đại $9\text{ dB}$ chưa đủ cho phòng rộng. | 1. Tăng âm lượng file `.wav` trên máy tính (tính năng Amplify trong Audacity).<br>2. Hàn thêm 1 đoạn dây ngắn nối chân **`GAIN`** sang **`GND`** trên mạch MAX98357A để tăng âm lượng lên $12\text{ dB}$. |
| **Bấm nút bị kẹt, không nảy lại** | Nút nhấn mua loại cao hơn $5\text{ mm}$ hoặc lỗ in 3D hơi khít do nhựa thừa. | Dùng giấy nhám mịn (hoặc mũi dao dọc giấy) chà nhẹ quanh thành tròn của nắp nút màu cho trượt mượt trong lỗ vỏ trên. |
| **Loa có tiếng "bụp" nhỏ rồi im lặng** | Pin quá yếu (dưới $3.2\text{V}$) hoặc dây nguồn loa câu nhầm vào chân `3V3` của XIAO. | Sạc đầy lại pin. Kiểm tra chắc chắn chân `VIN` của MAX98357A đang nối thẳng vào cực dương pin (`BAT+`), **không** nối vào chân `3V3`. |
| **Cắm sạc chỉ dùng được 1–2 ngày đã hết pin** | Quên kéo chân `SD` xuống mức thấp khi ngủ, hoặc code chưa tắt Wi-Fi/Bluetooth. | Kiểm tra lại dây nối `SD` $\rightarrow$ `D10` và đảm bảo trong code có lệnh tắt hẳn Wi-Fi/BLE trước khi vào chế độ Light-sleep. |

---

## 📁 Cấu Trúc Thư Mục Lưu Trữ Dự Án

Bạn nên lưu toàn bộ tài liệu dự án trong cùng một thư mục trên máy tính như sau để sau này dễ mở ra chỉnh sửa hoặc làm thêm chiếc thứ hai:

```text
thiet-bi-giao-tiep-esp32/
├── README.md                      # File hướng dẫn chi tiết này
├── tổng quan.png                  # Ảnh bản vẽ tổng quan thiết kế
├── vo_thiet_bi_esp32_xiao.scad    # File thiết kế vỏ in 3D (mở bằng OpenSCAD)
├── stl/                           # Thư mục chứa 3 file STL xuất ra để mang đi in
│   ├── vo_duoi.stl
│   ├── vo_tren.stl
│   └── nap_nut.stl
└── firmware/                      # (Bổ sung sau) Code nạp vào XIAO ESP32-C3 + 4 file âm thanh WAV
    ├── main.ino
    └── data/
        ├── cau1.wav
        ├── cau2.wav
        ├── cau3.wav
        └── cau4.wav
```